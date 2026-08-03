import 'package:freezed_annotation/freezed_annotation.dart';

part 'encryption.freezed.dart';
part 'encryption.g.dart';

/// Prekey à usage unique, encodée en base64.
@freezed
abstract class PreKeyInfo with _$PreKeyInfo {
  const factory PreKeyInfo({
    required int prekeyId,
    required String prekey,
  }) = _PreKeyInfo;

  factory PreKeyInfo.fromJson(Map<String, dynamic> json) =>
      _$PreKeyInfoFromJson(json);
}

/// Matériel public d'un pair, nécessaire pour ouvrir une session X3DH.
///
/// `prekey` est absent quand le stock du pair est épuisé : la session reste
/// possible, avec une garantie de confidentialité persistante moindre.
@freezed
abstract class PreKeyBundle with _$PreKeyBundle {
  const factory PreKeyBundle({
    required String userId,
    required String identityKey,
    required int signedPrekeyId,
    required String signedPrekey,
    required String signedPrekeySignature,
    PreKeyInfo? prekey,
  }) = _PreKeyBundle;

  factory PreKeyBundle.fromJson(Map<String, dynamic> json) =>
      _$PreKeyBundleFromJson(json);
}

/// Nombre de prekeys restantes pour l'utilisateur du token.
@freezed
abstract class PreKeyCount with _$PreKeyCount {
  const factory PreKeyCount({
    required String userId,
    @Default(0) int availablePrekeys,
  }) = _PreKeyCount;

  factory PreKeyCount.fromJson(Map<String, dynamic> json) =>
      _$PreKeyCountFromJson(json);
}
