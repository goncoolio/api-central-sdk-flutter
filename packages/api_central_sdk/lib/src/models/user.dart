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
    String? displayName,
    String? avatarUrl,
    String? email,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
