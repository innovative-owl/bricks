import 'dart:io';

import 'package:collection/collection.dart';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  // Determine where pubspec.yaml is located.

  // For now, just assume it's in the current directory.

  // parse "name: testing_site" from pubspec.yaml
  final name = await parsePubspecYaml(context);
  context.logger.info('Project name: $name');

  // update context.vars['app_name'] with the value of "name: testing_site"
  context.vars['projectName'] = name;
}

Future<String> parsePubspecYaml(HookContext context) async {
  final file = File('pubspec.yaml');

  final lines = file.readAsLinesSync();
  final line = lines.firstWhereOrNull((e) => e.startsWith('name:'));
  if (line == null) {
    context.logger.alert('Could not find "name:" in pubspec.yaml');
    exit(1);
  }

  final name = line.split(':').last.trim();
  return name;
}
