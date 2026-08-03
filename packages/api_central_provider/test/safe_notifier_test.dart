import 'package:api_central_provider/api_central_provider.dart';
import 'package:flutter_test/flutter_test.dart';

class _Sonde extends SafeNotifier {
  int valeur = 0;

  Future<void> reussir() => guard(() async {
        valeur = 1;
      });

  Future<void> echouer() => guard(
        () async => throw Exception('réseau coupé'),
        onError: 'Impossible de charger',
      );

  /// Expose le membre protégé pour le tester par la sous-classe, comme le
  /// ferait un vrai notifier.
  void notifierDepuisLaSousClasse() => safeNotify();
}

void main() {
  group('SafeNotifier', () {
    test('signale le chargement puis sa fin', () async {
      final sonde = _Sonde();
      final etats = <bool>[];
      sonde.addListener(() => etats.add(sonde.isLoading));

      await sonde.reussir();

      expect(etats, equals([true, false]));
      expect(sonde.valeur, equals(1));
      expect(sonde.errorMessage, isNull);
    });

    test('capture l erreur sans la propager', () async {
      final sonde = _Sonde();

      await expectLater(sonde.echouer(), completes);

      expect(sonde.errorMessage, equals('Impossible de charger'));
      expect(sonde.isLoading, isFalse);
    });

    test('efface l erreur précédente au chargement suivant', () async {
      final sonde = _Sonde();
      await sonde.echouer();
      expect(sonde.errorMessage, isNotNull);

      await sonde.reussir();

      expect(sonde.errorMessage, isNull);
    });

    test('ne notifie plus après dispose', () async {
      final sonde = _Sonde();
      var appels = 0;
      sonde.addListener(() => appels++);
      sonde.dispose();

      sonde.notifierDepuisLaSousClasse();

      expect(appels, isZero,
          reason: 'notifier après dispose lève une erreur en Flutter');
    });
  });
}
