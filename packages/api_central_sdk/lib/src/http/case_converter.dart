/// Conversion de casse entre le SDK (camelCase) et l'API (snake_case).
///
/// L'API Central S2S sérialise en `snake_case`. Sans cette conversion,
/// un champ comme `sent_count` reste inaccessible côté Dart.
library;

final RegExp _upperCase = RegExp(r'[A-Z]');
final RegExp _underscoreLetter = RegExp(r'_([a-z])');

/// `userId` → `user_id`. Idempotent sur une chaîne déjà en snake_case.
String camelToSnake(String s) =>
    s.replaceAllMapped(_upperCase, (m) => '_${m[0]!.toLowerCase()}');

/// `sent_count` → `sentCount`. Idempotent sur une chaîne déjà en camelCase.
String snakeToCamel(String s) =>
    s.replaceAllMapped(_underscoreLetter, (m) => m[1]!.toUpperCase());

Object? _convert(Object? value, String Function(String) convertKey) {
  if (value is Map) {
    return value.map(
      (key, v) => MapEntry(convertKey(key as String), _convert(v, convertKey)),
    );
  }
  if (value is List) {
    return value.map((v) => _convert(v, convertKey)).toList();
  }
  return value;
}

/// Convertit récursivement les clés d'une structure en `snake_case`.
Object? deepToSnakeCase(Object? value) => _convert(value, camelToSnake);

/// Convertit récursivement les clés d'une structure en `camelCase`.
Object? deepToCamelCase(Object? value) => _convert(value, snakeToCamel);
