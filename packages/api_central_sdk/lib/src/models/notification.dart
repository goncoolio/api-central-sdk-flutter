import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

/// Notification destinée à un utilisateur.
///
/// Nommée `AppNotification` et non `Notification` pour éviter la collision avec
/// les types du même nom exposés par `dart:html` et plusieurs paquets Flutter.
///
/// L'API sérialise la catégorie sous la clé `type`, pas `notificationType`, et
/// ne renvoie pas l'identifiant du destinataire.
@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String type,
    required String title,
    required String body,
    Map<String, dynamic>? data,
    @Default(false) bool isRead,
    DateTime? readAt,
    DateTime? createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}

/// Résultat d'un envoi groupé.
@freezed
abstract class BulkSendResult with _$BulkSendResult {
  const factory BulkSendResult({
    @Default(false) bool success,
    @Default(0) int sentCount,
  }) = _BulkSendResult;

  factory BulkSendResult.fromJson(Map<String, dynamic> json) =>
      _$BulkSendResultFromJson(json);
}

/// Résultat d'une diffusion à toute l'application.
@freezed
abstract class BroadcastResult with _$BroadcastResult {
  const factory BroadcastResult({
    @Default(false) bool success,
    @Default(0) int sentCount,
    @Default(0) int totalUsers,
  }) = _BroadcastResult;

  factory BroadcastResult.fromJson(Map<String, dynamic> json) =>
      _$BroadcastResultFromJson(json);
}

/// Résultat d'un marquage comme lu.
@freezed
abstract class MarkReadResult with _$MarkReadResult {
  const factory MarkReadResult({
    @Default(false) bool success,
    @Default(0) int updatedCount,
  }) = _MarkReadResult;

  factory MarkReadResult.fromJson(Map<String, dynamic> json) =>
      _$MarkReadResultFromJson(json);
}
