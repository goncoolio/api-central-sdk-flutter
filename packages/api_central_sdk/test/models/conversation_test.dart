import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('Conversation', () {
    test('lit le champ type, que l API ne nomme pas conversationType', () {
      final conversation = Conversation.fromJson(const {
        'id': 'c1',
        'applicationId': 'app-42',
        'type': 'direct',
        'participants': <dynamic>[],
        'unreadCount': 0,
        'createdAt': '2026-08-02T10:00:00Z',
      });

      expect(conversation.type, equals(ConversationType.direct));
      expect(conversation.unreadCount, equals(0));
    });

    test('désérialise les participants et le dernier message', () {
      final conversation = Conversation.fromJson(const {
        'id': 'c1',
        'applicationId': 'app-42',
        'type': 'group',
        'title': 'Équipe',
        'participants': [
          {
            'id': 'p1',
            'user': {'id': 'u1', 'externalUserId': 'ext-1'},
            'role': 'admin',
            'joinedAt': '2026-08-01T10:00:00Z',
            'isMuted': false,
          },
        ],
        'lastMessage': {
          'id': 'm1',
          'content': 'Salut',
          'contentType': 'text',
          'createdAt': '2026-08-02T10:00:00Z',
        },
        'unreadCount': 3,
        'createdAt': '2026-08-01T10:00:00Z',
      });

      expect(
          conversation.participants.single.role, equals(ParticipantRole.admin));
      expect(conversation.lastMessage?.content, equals('Salut'));
      expect(conversation.unreadCount, equals(3));
    });
  });

  group('Message', () {
    test('désérialise réactions et pièces jointes', () {
      final message = Message.fromJson(const {
        'id': 'm1',
        'conversationId': 'c1',
        'sender': {'id': 'u1', 'externalUserId': 'ext-1'},
        'content': 'Bonjour',
        'contentType': 'text',
        'reactions': [
          {'emoji': '👍', 'userId': 'u2', 'userName': 'Bob'},
        ],
        'isEdited': false,
        'isDeleted': false,
        'createdAt': '2026-08-02T10:00:00Z',
      });

      expect(message.content, equals('Bonjour'));
      expect(message.contentType, equals(ContentType.text));
      expect(message.reactions.single.emoji, equals('👍'));
      expect(message.isEdited, isFalse);
    });
  });
}
