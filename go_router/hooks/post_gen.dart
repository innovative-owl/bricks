import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final appDirectory = context.vars['app_name'] as String? ?? '';
  await installDependencies(
    context,
    packages: [
      'go_router',
      'hooks_riverpod',
      'riverpod_annotation',
      'dev:riverpod_generator',
      'dev:build_runner',
    ],
    appDirectory: appDirectory,
  );

  final log = context.logger.progress('Running build_runner');
  try {
    await _runBuildRunner(appDirectory);
    log.complete();
  } catch (e) {
    log.fail();
  }
}

Future<void> installDependencies(
  HookContext context, {
  required List<String> packages,
  required String appDirectory,
}) async {
  for (final package in packages) {
    final log = context.logger.progress('Installing $package');
    await _installPackage(package, appDirectory);
    log.complete();
  }
}

Future<ProcessResult> _runBuildRunner(String app) => Process.run(
    'dart',
    [
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
    ],
    workingDirectory: './$app',
    runInShell: true);

Future<ProcessResult> _installPackage(String p, String app) =>
    Process.run('dart', ['pub', 'add', p], workingDirectory: './$app');
