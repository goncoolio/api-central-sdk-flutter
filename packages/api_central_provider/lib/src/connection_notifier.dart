import 'dart:async';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter/foundation.dart';

import 'safe_notifier.dart';

/// État de la connexion temps réel.
///
/// Alimente typiquement un bandeau « hors ligne » ou un indicateur discret.
class ConnectionNotifier extends SafeNotifier {
  ConnectionNotifier({required this.sdk});

  final ApiCentral sdk;

  ConnectionState _state = ConnectionState.disconnected;
  StreamSubscription<ConnectionState>? _abonnement;

  ConnectionState get state => _state;
  bool get isConnected => _state == ConnectionState.connected;

  /// Suit l'état du WebSocket. À appeler après `connectRealtime`.
  void bind() {
    final realtime = sdk.realtime;
    if (realtime == null) return;

    _state = realtime.state;
    unawaited(_abonnement?.cancel());
    _abonnement = realtime.states.listen((etat) {
      _state = etat;
      safeNotify();
    });
  }

  @visibleForTesting
  void debugSetState(ConnectionState etat) {
    _state = etat;
    safeNotify();
  }

  @override
  void dispose() {
    unawaited(_abonnement?.cancel());
    super.dispose();
  }
}
