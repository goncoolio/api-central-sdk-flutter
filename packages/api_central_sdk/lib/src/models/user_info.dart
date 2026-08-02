import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

/// Forme compacte d'un utilisateur, telle qu'imbriquée dans les réponses.
///
/// Partagée par les conversations, les tickets et les directs : elle vit dans
/// son propre fichier pour qu'aucun domaine n'ait à dépendre d'un autre.
@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String id,
    required String externalUserId,
    String? displayName,
    String? avatarUrl,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
