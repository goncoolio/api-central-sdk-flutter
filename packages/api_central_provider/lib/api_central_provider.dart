/// ChangeNotifier prêts à brancher pour l'API Central S2S.
///
/// Chaque notifier compose le SDK sans le modifier : une application qui gère
/// son état autrement peut ignorer ce package.
library;

export 'src/connection_notifier.dart';
export 'src/conversations_notifier.dart';
export 'src/messages_notifier.dart';
export 'src/notifications_notifier.dart';
export 'src/safe_notifier.dart';
