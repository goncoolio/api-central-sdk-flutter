import 'package:freezed_annotation/freezed_annotation.dart';

part 'presence.freezed.dart';
part 'presence.g.dart';

/// État de présence d'un utilisateur.
///
/// `status` est une chaîne libre côté API : `online`, `offline`, `away` sont
/// les valeurs usuelles, mais rien n'empêche une application d'en définir
/// d'autres.
@freezed
abstract class PresenceResponse with _$PresenceResponse {
  const factory PresenceResponse({
    required String userId,
    required String status,
    String? lastSeenAt,
  }) = _PresenceResponse;

  factory PresenceResponse.fromJson(Map<String, dynamic> json) =>
      _$PresenceResponseFromJson(json);
}

/// Statut d'un utilisateur, tel que le porte l'événement temps réel
/// `presence_status`.
///
/// Forme réduite de [PresenceResponse] : le WebSocket ne transmet pas
/// `lastSeenAt`.
@freezed
abstract class PresenceStatusItem with _$PresenceStatusItem {
  const factory PresenceStatusItem({
    required String userId,
    required String status,
  }) = _PresenceStatusItem;

  factory PresenceStatusItem.fromJson(Map<String, dynamic> json) =>
      _$PresenceStatusItemFromJson(json);
}
