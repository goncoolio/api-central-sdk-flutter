// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryInfo _$CategoryInfoFromJson(Map<String, dynamic> json) =>
    _CategoryInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$CategoryInfoToJson(_CategoryInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

_SupportCategory _$SupportCategoryFromJson(Map<String, dynamic> json) =>
    _SupportCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      applicationId: json['applicationId'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      parentId: json['parentId'] as String?,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SupportCategoryToJson(_SupportCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'applicationId': instance.applicationId,
      'description': instance.description,
      'icon': instance.icon,
      'parentId': instance.parentId,
      'sortOrder': instance.sortOrder,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_Ticket _$TicketFromJson(Map<String, dynamic> json) => _Ticket(
  id: json['id'] as String,
  ticketNumber: json['ticketNumber'] as String,
  user: UserInfo.fromJson(json['user'] as Map<String, dynamic>),
  subject: json['subject'] as String,
  status: $enumDecode(_$TicketStatusEnumMap, json['status']),
  priority: $enumDecode(_$TicketPriorityEnumMap, json['priority']),
  conversationId: json['conversationId'] as String?,
  category: json['category'] == null
      ? null
      : CategoryInfo.fromJson(json['category'] as Map<String, dynamic>),
  assignedTo: json['assignedTo'] == null
      ? null
      : UserInfo.fromJson(json['assignedTo'] as Map<String, dynamic>),
  description: json['description'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  firstResponseAt: json['firstResponseAt'] == null
      ? null
      : DateTime.parse(json['firstResponseAt'] as String),
  resolvedAt: json['resolvedAt'] == null
      ? null
      : DateTime.parse(json['resolvedAt'] as String),
  closedAt: json['closedAt'] == null
      ? null
      : DateTime.parse(json['closedAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$TicketToJson(_Ticket instance) => <String, dynamic>{
  'id': instance.id,
  'ticketNumber': instance.ticketNumber,
  'user': instance.user.toJson(),
  'subject': instance.subject,
  'status': _$TicketStatusEnumMap[instance.status]!,
  'priority': _$TicketPriorityEnumMap[instance.priority]!,
  'conversationId': instance.conversationId,
  'category': instance.category?.toJson(),
  'assignedTo': instance.assignedTo?.toJson(),
  'description': instance.description,
  'tags': instance.tags,
  'firstResponseAt': instance.firstResponseAt?.toIso8601String(),
  'resolvedAt': instance.resolvedAt?.toIso8601String(),
  'closedAt': instance.closedAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$TicketStatusEnumMap = {
  TicketStatus.open: 'open',
  TicketStatus.pending: 'pending',
  TicketStatus.inProgress: 'in_progress',
  TicketStatus.resolved: 'resolved',
  TicketStatus.closed: 'closed',
};

const _$TicketPriorityEnumMap = {
  TicketPriority.low: 'low',
  TicketPriority.medium: 'medium',
  TicketPriority.high: 'high',
  TicketPriority.urgent: 'urgent',
};

_TicketReply _$TicketReplyFromJson(Map<String, dynamic> json) => _TicketReply(
  id: json['id'] as String,
  ticketId: json['ticketId'] as String,
  senderId: json['senderId'] as String,
  senderType: $enumDecode(_$SenderTypeEnumMap, json['senderType']),
  content: json['content'] as String,
  senderName: json['senderName'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$TicketReplyToJson(_TicketReply instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticketId': instance.ticketId,
      'senderId': instance.senderId,
      'senderType': _$SenderTypeEnumMap[instance.senderType]!,
      'content': instance.content,
      'senderName': instance.senderName,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$SenderTypeEnumMap = {
  SenderType.admin: 'admin',
  SenderType.user: 'user',
  SenderType.system: 'system',
};
