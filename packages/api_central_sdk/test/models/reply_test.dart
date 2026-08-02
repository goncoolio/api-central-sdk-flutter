import 'dart:convert';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('Message.replyTo', () {
    test('se désérialise sur plusieurs niveaux', () {
      final message = Message.fromJson(const {
        'id': 'm3',
        'conversationId': 'c1',
        'content': 'Troisième',
        'contentType': 'text',
        'replyTo': {
          'id': 'm2',
          'conversationId': 'c1',
          'content': 'Deuxième',
          'contentType': 'text',
          'replyTo': {
            'id': 'm1',
            'conversationId': 'c1',
            'content': 'Premier',
            'contentType': 'text',
          },
        },
      });

      expect(message.replyTo?.content, equals('Deuxième'));
      expect(message.replyTo?.replyTo?.content, equals('Premier'));
      expect(message.replyTo?.replyTo?.replyTo, isNull);
    });

    test('vaut null quand le message ne répond à rien', () {
      final message = Message.fromJson(const {
        'id': 'm1',
        'conversationId': 'c1',
        'content': 'Bonjour',
        'contentType': 'text',
      });

      expect(message.replyTo, isNull);
    });

    test('se sérialise en Map imbriquée, pas en objet Dart', () {
      const message = Message(
        id: 'm2',
        conversationId: 'c1',
        content: 'Réponse',
        contentType: ContentType.text,
        replyTo: Message(
          id: 'm1',
          conversationId: 'c1',
          content: 'Original',
          contentType: ContentType.text,
        ),
      );

      final json = message.toJson();

      expect(json['replyTo'], isA<Map<String, dynamic>>());
      expect((json['replyTo']! as Map)['content'], equals('Original'));
      // jsonEncode échouerait si un objet Dart traînait dans la structure.
      expect(() => jsonEncode(json), returnsNormally);
    });
  });

  group('explicit_to_json', () {
    test('Conversation sérialise ses participants en Map', () {
      const conversation = Conversation(
        id: 'c1',
        type: ConversationType.group,
        participants: [
          Participant(
            id: 'p1',
            user: UserInfo(id: 'u1', externalUserId: 'ext-1'),
            role: ParticipantRole.admin,
          ),
        ],
      );

      final json = conversation.toJson();
      final participants = json['participants']! as List;

      expect(participants.single, isA<Map<String, dynamic>>());
      expect((participants.single as Map)['user'], isA<Map<String, dynamic>>());
      expect(() => jsonEncode(json), returnsNormally);
    });

    test('Message sérialise son expéditeur et ses réactions en Map', () {
      const message = Message(
        id: 'm1',
        conversationId: 'c1',
        content: 'Bonjour',
        contentType: ContentType.text,
        sender: UserInfo(id: 'u1', externalUserId: 'ext-1'),
        reactions: [Reaction(emoji: '👍', userId: 'u2')],
      );

      final json = message.toJson();

      expect(json['sender'], isA<Map<String, dynamic>>());
      expect((json['reactions']! as List).single, isA<Map<String, dynamic>>());
      expect(() => jsonEncode(json), returnsNormally);
    });
  });
}
