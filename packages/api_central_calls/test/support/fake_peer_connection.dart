import 'package:flutter_webrtc/flutter_webrtc.dart';

/// `RTCPeerConnection` simulée : mémorise ce que le gestionnaire lui demande et
/// laisse le test déclencher ses rappels.
///
/// `noSuchMethod` couvre le reste de l'interface, que ces tests n'utilisent
/// pas : un membre oublié échoue alors franchement, au lieu de passer.
class FakePeerConnection implements RTCPeerConnection {
  @override
  Function(RTCIceCandidate candidate)? onIceCandidate;

  @override
  Function(RTCTrackEvent event)? onTrack;

  @override
  Function(RTCPeerConnectionState state)? onConnectionState;

  final List<RTCIceCandidate> candidatsAjoutes = [];
  RTCSessionDescription? descriptionLocale;
  RTCSessionDescription? descriptionDistante;
  bool fermee = false;

  @override
  Future<RTCSessionDescription> createOffer([
    Map<String, dynamic> constraints = const {},
  ]) async => RTCSessionDescription('sdp-offre', 'offer');

  @override
  Future<RTCSessionDescription> createAnswer([
    Map<String, dynamic> constraints = const {},
  ]) async => RTCSessionDescription('sdp-reponse', 'answer');

  @override
  Future<void> setLocalDescription(RTCSessionDescription description) async {
    descriptionLocale = description;
  }

  @override
  Future<void> setRemoteDescription(RTCSessionDescription description) async {
    descriptionDistante = description;
  }

  @override
  Future<void> addCandidate(RTCIceCandidate candidate) async {
    candidatsAjoutes.add(candidate);
  }

  @override
  Future<void> close() async {
    fermee = true;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnsupportedError('${invocation.memberName} n est pas simulé');
}

/// Flux média local simulé, sans piste : le gestionnaire n'a rien à publier.
class FakeMediaStream implements MediaStream {
  bool liberee = false;

  @override
  String get id => 'flux-local';

  @override
  List<MediaStreamTrack> getTracks() => const [];

  @override
  List<MediaStreamTrack> getAudioTracks() => const [];

  @override
  List<MediaStreamTrack> getVideoTracks() => const [];

  @override
  Future<void> dispose() async {
    liberee = true;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnsupportedError('${invocation.memberName} n est pas simulé');
}
