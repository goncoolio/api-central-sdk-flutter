import 'package:flutter/foundation.dart';

/// Base commune aux notifiers du SDK.
///
/// Apporte deux garanties que chaque écran refait sinon à la main : ne jamais
/// notifier après `dispose()`, et ne jamais vider l'état déjà chargé quand une
/// requête échoue.
abstract class SafeNotifier extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  bool _disposed = false;

  bool get isLoading => _isLoading;

  /// Message d'erreur du dernier chargement, `null` si tout va bien.
  String? get errorMessage => _errorMessage;

  bool get isDisposed => _disposed;

  /// Notifie, sauf si l'objet a été détruit.
  ///
  /// Un `notifyListeners()` après `dispose()` lève en Flutter ; cela arrive dès
  /// qu'une requête se termine après la fermeture de l'écran.
  @protected
  void safeNotify() {
    if (_disposed) return;
    notifyListeners();
  }

  /// Exécute [action] en gérant l'état de chargement et les erreurs.
  ///
  /// En cas d'échec, l'état déjà chargé est conservé : une coupure réseau ne
  /// doit pas vider un écran.
  @protected
  Future<void> guard(
    Future<void> Function() action, {
    String? onError,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    safeNotify();

    try {
      await action();
    } on Object catch (e) {
      _errorMessage = onError ?? e.toString();
      if (kDebugMode) {
        debugPrint('[api_central_provider] $runtimeType: $e');
      }
    } finally {
      _isLoading = false;
      safeNotify();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
