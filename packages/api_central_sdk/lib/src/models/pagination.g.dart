// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    _PaginationMeta(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationMetaToJson(_PaginationMeta instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'totalPages': instance.totalPages,
    };

_PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PaginatedResponse<T>(
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  pagination: PaginationMeta.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PaginatedResponseToJson<T>(
  _PaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'pagination': instance.pagination.toJson(),
};

_CursorMeta _$CursorMetaFromJson(Map<String, dynamic> json) => _CursorMeta(
  hasMore: json['hasMore'] as bool,
  nextCursor: json['nextCursor'] as String?,
);

Map<String, dynamic> _$CursorMetaToJson(_CursorMeta instance) =>
    <String, dynamic>{
      'hasMore': instance.hasMore,
      'nextCursor': instance.nextCursor,
    };

_CursorResponse<T> _$CursorResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _CursorResponse<T>(
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  pagination: CursorMeta.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CursorResponseToJson<T>(
  _CursorResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'pagination': instance.pagination.toJson(),
};
