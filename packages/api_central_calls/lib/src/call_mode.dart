import 'package:api_central_sdk/api_central_sdk.dart';

/// Couche média d'un appel : WebRTC direct ou SFU LiveKit.
///
/// Le mode se décide une fois, au démarrage de l'appel ([forCall]), et ne
/// change plus ensuite : un participant ajouté à un appel à deux déjà établi
/// en P2P ne le fait pas basculer sur LiveKit.
enum CallMode {
  /// WebRTC direct entre les deux participants, piloté par `CallManager`.
  p2p,

  /// SFU LiveKit, piloté par `GroupCallManager`.
  group;

  /// Nombre de participants, initiateur compris, à partir duquel un appel
  /// passe par LiveKit.
  static const int minGroupParticipants = 3;

  /// Mode de [call] : LiveKit dès [minGroupParticipants] participants.
  ///
  /// Tous les participants comptent, quel que soit leur statut, y compris un
  /// invité qui a refusé : l'API ne retire personne de la liste. L'appelant et
  /// ceux qui décrochent aboutissent ainsi au même mode, tant que personne
  /// n'est ajouté à l'appel entre-temps.
  static CallMode forCall(Call call) =>
      call.participants.length >= minGroupParticipants ? group : p2p;
}
