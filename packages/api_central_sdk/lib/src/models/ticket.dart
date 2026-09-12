import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_info.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

/// Cycle de vie d'un ticket.
enum TicketStatus {
  @JsonValue('open')
  open,
  @JsonValue('pending')
  pending,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('resolved')
  resolved,
  @JsonValue('closed')
  closed,
}

/// Urgence d'un ticket.
enum TicketPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('urgent')
  urgent,
}

/// Origine d'une réponse de ticket.
enum SenderType {
  @JsonValue('admin')
  admin,
  @JsonValue('user')
  user,
  @JsonValue('system')
  system,
}

/// Forme compacte d'une catégorie, imbriquée dans un ticket.
@freezed
abstract class CategoryInfo with _$CategoryInfo {
  const factory CategoryInfo({
    required String id,
    required String name,
    required String slug,
  }) = _CategoryInfo;

  factory CategoryInfo.fromJson(Map<String, dynamic> json) =>
      _$CategoryInfoFromJson(json);
}

/// Catégorie de support, telle que renvoyée par `/support/categories`.
@freezed
abstract class SupportCategory with _$SupportCategory {
  const factory SupportCategory({
    required String id,
    required String name,
    required String slug,
    String? applicationId,
    String? description,
    String? icon,
    String? parentId,
    @Default(0) int sortOrder,
    @Default(true) bool isActive,
    DateTime? createdAt,
  }) = _SupportCategory;

  factory SupportCategory.fromJson(Map<String, dynamic> json) =>
      _$SupportCategoryFromJson(json);
}

/// Ticket de support.
@freezed
abstract class Ticket with _$Ticket {
  const factory Ticket({
    required String id,
    required String ticketNumber,
    required UserInfo user,
    required String subject,
    required TicketStatus status,
    required TicketPriority priority,
    String? conversationId,
    CategoryInfo? category,
    UserInfo? assignedTo,
    String? description,
    List<String>? tags,
    DateTime? firstResponseAt,
    DateTime? resolvedAt,
    DateTime? closedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}

/// Réponse apportée à un ticket.
@freezed
abstract class TicketReply with _$TicketReply {
  const factory TicketReply({
    required String id,
    required String ticketId,
    required String senderId,
    required SenderType senderType,
    required String content,
    String? senderName,
    DateTime? createdAt,
  }) = _TicketReply;

  factory TicketReply.fromJson(Map<String, dynamic> json) =>
      _$TicketReplyFromJson(json);
}
