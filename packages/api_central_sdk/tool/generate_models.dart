// Génère les modèles freezed à partir du spec OpenAPI de l'API Central S2S.
//
// Usage : dart run tool/generate_models.dart /tmp/openapi.json
//
// La sortie va dans `.generated/models/`, un dossier de transit hors de `lib/`
// et hors de l'analyse : ces modèles ne sont pas publiables tels quels. Les
// schémas OpenAPI portent parfois des noms internes et des types trop lâches,
// et 83 opérations sur 125 n'exposent aucun schéma de réponse. Chaque modèle
// est relu puis déplacé à la main vers `lib/src/models/`.

import 'dart:convert';
import 'dart:io';

const _entete = "import 'package:freezed_annotation/freezed_annotation.dart';";

void main(List<String> args) {
  if (args.isEmpty) {
    stderr.writeln('Usage : dart run tool/generate_models.dart <openapi.json>');
    exit(64);
  }

  final spec =
      jsonDecode(File(args.first).readAsStringSync()) as Map<String, dynamic>;
  final components = spec['components'] as Map<String, dynamic>?;
  final schemas = components?['schemas'] as Map<String, dynamic>?;

  if (schemas == null || schemas.isEmpty) {
    stderr.writeln('Aucun schéma trouvé dans le spec.');
    exit(1);
  }

  final dossier = Directory('.generated/models');
  if (!dossier.existsSync()) dossier.createSync(recursive: true);

  var generes = 0;
  for (final entry in schemas.entries) {
    final nom = entry.key;
    final schema = entry.value as Map<String, dynamic>;
    if (schema['type'] != 'object') continue;

    final fichier = _snake(nom);
    final champs = _champs(schema);
    if (champs.isEmpty) continue;

    File('${dossier.path}/$fichier.dart').writeAsStringSync('''
$_entete

part '$fichier.freezed.dart';
part '$fichier.g.dart';

@freezed
abstract class $nom with _\$$nom {
  const factory $nom({
$champs  }) = _$nom;

  factory $nom.fromJson(Map<String, dynamic> json) => _\$${nom}FromJson(json);
}
''');
    generes++;
  }

  stdout.writeln('$generes modèles générés dans ${dossier.path}');
  stdout.writeln('Relire chaque modèle, puis copier ceux retenus vers '
      'lib/src/models/ et lancer :');
  stdout.writeln('  dart run build_runner build --delete-conflicting-outputs');
}

String _champs(Map<String, dynamic> schema) {
  final props = schema['properties'] as Map<String, dynamic>?;
  if (props == null) return '';

  final requis =
      (schema['required'] as List<dynamic>? ?? const []).cast<String>();
  final buffer = StringBuffer();

  for (final entry in props.entries) {
    final nom = _camel(entry.key);
    final type = _type(entry.value as Map<String, dynamic>);
    final estRequis = requis.contains(entry.key);
    buffer.writeln(
      estRequis ? '    required $type $nom,' : '    $type? $nom,',
    );
  }
  return buffer.toString();
}

String _type(Map<String, dynamic> schema) {
  final format = schema['format'] as String?;
  if (format == 'date-time') return 'DateTime';
  if (schema[r'$ref'] != null) {
    return (schema[r'$ref'] as String).split('/').last;
  }

  return switch (schema['type']) {
    'integer' => 'int',
    'number' => 'double',
    'boolean' => 'bool',
    'array' =>
      'List<${_type(schema['items'] as Map<String, dynamic>? ?? const {})}>',
    'object' => 'Map<String, dynamic>',
    _ => 'String',
  };
}

String _snake(String s) => s
    .replaceAllMapped(RegExp('[A-Z]'), (m) => '_${m[0]!.toLowerCase()}')
    .replaceFirst(RegExp('^_'), '');

String _camel(String s) =>
    s.replaceAllMapped(RegExp('_([a-z])'), (m) => m[1]!.toUpperCase());
