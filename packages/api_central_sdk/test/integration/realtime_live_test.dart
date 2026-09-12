@Tags(['integration'])
library;

import 'dart:io' show Platform;

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:api_central_sdk/server.dart' show ApiCentralServer;
import 'package:test/test.dart';

// Configuration lue dans l'environnement : aucun credential n'est versionné.
// Sans API_CENTRAL_API_KEY et API_CENTRAL_API_SECRET, la suite est ignorée.
//
//   API_CENTRAL_API_KEY=… API_CENTRAL_API_SECRET=… \
//   API_CENTRAL_APPLICATION_ID=… dart test --tags integration
final _env = Platform.environment;
final _baseUrl = _env['API_CENTRAL_BASE_URL'] ?? 'http://localhost:3004/s2s/v1';
final _wsUrl = _env['API_CENTRAL_WS_URL'] ?? 'ws://localhost:3004/events';
final _apiKey = _env['API_CENTRAL_API_KEY'] ?? '';
final _apiSecret = _env['API_CENTRAL_API_SECRET'] ?? '';
final _applicationId = _env['API_CENTRAL_APPLICATION_ID'] ?? '';

final _config = ApiCentralConfig(
  baseUrl: _baseUrl,
  wsUrl: _wsUrl,
  applicationId: _applicationId,
);

ApiCentralServer _serveur() => ApiCentralServer(
      config: _config,
      apiKey: _apiKey,
      apiSecret: _apiSecret,
    );

void main() {
  late ApiCentralServer serveur;
  late ApiCentral sdkApp;
  late String user1;
  late String user2;
  late String conversationId;
  var disponible = false;

  setUpAll(() async {
    if (_apiKey.isEmpty || _apiSecret.isEmpty) return;
    try {
      serveur = _serveur();
      final appToken = (await serveur.authenticate()).accessToken;
      sdkApp = ApiCentral(config: _config, tokenProvider: () async => appToken);
      disponible = true;
    } on Object {
      return;
    }

    final horodatage = DateTime.now().millisecondsSinceEpoch;
    user1 = (await sdkApp.users.create(
      externalUserId: 'dart-rt-1-$horodatage',
      displayName: 'Un',
    ))
        .id;
    user2 = (await sdkApp.users.create(
      externalUserId: 'dart-rt-2-$horodatage',
      displayName: 'Deux',
    ))
        .id;

    conversationId = (await sdkApp.messaging.createConversation(
      type: ConversationType.direct,
      participantIds: [user1, user2],
    ))
        .id;
  });

  tearDownAll(() async {
    if (!disponible) return;
    await sdkApp.messaging.deleteConversation(conversationId);
    await sdkApp.users.delete(user1);
    await sdkApp.users.delete(user2);
  });

  /// Ouvre une connexion temps réel pour [user1] et rejoint la conversation.
  Future<(ApiCentral, RealtimeModule)> connecte() async {
    final socketToken = await serveur.userToken(user1);
    final sdk =
        ApiCentral(config: _config, tokenProvider: () async => socketToken);

    final realtime = await sdk.connectRealtime();
    await realtime.on<ConnectedEvent>().first.timeout(
          const Duration(seconds: 5),
        );

    realtime.joinConversation(conversationId);
    await realtime.on<ConversationJoinedEvent>().first.timeout(
          const Duration(seconds: 5),
        );

    return (sdk, realtime);
  }

  test('reçoit connected à l ouverture', () async {
    if (!disponible) {
      markTestSkipped('API injoignable sur $_baseUrl');
      return;
    }

    final socketToken = await serveur.userToken(user1);
    final sdk =
        ApiCentral(config: _config, tokenProvider: () async => socketToken);

    final realtime = await sdk.connectRealtime();
    final connecte =
        await realtime.on<ConnectedEvent>().first.timeout(
              const Duration(seconds: 5),
            );

    expect(connecte.socketId, isNotNull);
    expect(realtime.state, equals(ConnectionState.connected));

    await sdk.disconnectRealtime();
  }, timeout: const Timeout(Duration(seconds: 30)));

  test('reçoit message_new après un envoi REST', () async {
    if (!disponible) {
      markTestSkipped('API injoignable sur $_baseUrl');
      return;
    }

    final (sdk, realtime) = await connecte();

    final attendu =
        realtime.onMessageNew.first.timeout(const Duration(seconds: 10));

    await sdkApp.messaging.sendMessage(
      conversationId,
      senderId: user2,
      content: 'Bonjour depuis Dart',
    );

    final event = await attendu;
    expect(event.content, equals('Bonjour depuis Dart'));
    expect(event.conversationId, equals(conversationId));

    await sdk.disconnectRealtime();
  }, timeout: const Timeout(Duration(seconds: 30)));

  test('reçoit message_read avec ses quatre champs', () async {
    if (!disponible) {
      markTestSkipped('API injoignable sur $_baseUrl');
      return;
    }

    final (sdk, realtime) = await connecte();

    final message = await sdkApp.messaging.sendMessage(
      conversationId,
      senderId: user1,
      content: 'À lire',
    );

    final attendu =
        realtime.onMessageRead.first.timeout(const Duration(seconds: 10));

    // L'API ne diffuse l'accusé que si messageId est fourni.
    await sdkApp.messaging.markAsRead(
      conversationId,
      userId: user2,
      messageId: message.id,
    );

    final event = await attendu;
    expect(event.conversationId, equals(conversationId));
    expect(event.userId, equals(user2));
    expect(event.lastReadMessageId, equals(message.id));
    expect(DateTime.tryParse(event.readAt), isNotNull);

    await sdk.disconnectRealtime();
  }, timeout: const Timeout(Duration(seconds: 30)));

  test('reçoit typing_update', () async {
    if (!disponible) {
      markTestSkipped('API injoignable sur $_baseUrl');
      return;
    }

    final (sdk, realtime) = await connecte();

    final attendu =
        realtime.onTypingUpdate.first.timeout(const Duration(seconds: 10));

    await sdkApp.messaging.sendTyping(conversationId, userId: user2);

    final event = await attendu;
    expect(event.conversationId, equals(conversationId));

    await sdk.disconnectRealtime();
  }, timeout: const Timeout(Duration(seconds: 30)));
}
