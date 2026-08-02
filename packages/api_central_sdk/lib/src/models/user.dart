import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Utilisateur d'une application.
///
/// Freezed 3.x impose `abstract` sur les classes annotées `@freezed`.
@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String externalUserId,
    String? applicationId,
    String? displayName,
    String? email,
    String? avatarUrl,
    Map<String, dynamic>? metadata,
    DateTime? lastSeenAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
