import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

/// Métadonnées d'une liste paginée par numéro de page.
@freezed
abstract class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int page,
    required int limit,
    required int total,
    required int totalPages,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

/// Liste paginée par numéro de page.
@Freezed(genericArgumentFactories: true)
abstract class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    required List<T> data,
    required PaginationMeta pagination,
  }) = _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);
}

/// Métadonnées d'une liste paginée par curseur, utilisée pour les messages.
@freezed
abstract class CursorMeta with _$CursorMeta {
  const factory CursorMeta({
    required bool hasMore,
    String? nextCursor,
  }) = _CursorMeta;

  factory CursorMeta.fromJson(Map<String, dynamic> json) =>
      _$CursorMetaFromJson(json);
}

/// Liste paginée par curseur.
@Freezed(genericArgumentFactories: true)
abstract class CursorResponse<T> with _$CursorResponse<T> {
  const factory CursorResponse({
    required List<T> data,
    required CursorMeta pagination,
  }) = _CursorResponse<T>;

  factory CursorResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$CursorResponseFromJson(json, fromJsonT);
}
