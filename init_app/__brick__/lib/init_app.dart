{{#usesFirebase}}
import 'package:firebase_core/firebase_core.dart';
import 'package:{{ projectName }}/firebase_config.dart';
{{/usesFirebase}}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{ projectName }}/app_config.dart';
import 'package:{{ projectName }}/main.dart';

initAndRunApp({
  required String appName,
  required AppEnvironment appEnvironment,
  {{#usesFirebase}}
  required FirebaseOptions firebaseOptions,
  {{/usesFirebase}}
}) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  {{#usesFirebase}}
  await Firebase.initializeApp(
    options: firebaseOptions,
  );

  await configureFirebase(appEnvironment);
  {{/usesFirebase}}

  final container = ProviderContainer(
    overrides: [],
  );

  final appConfig = AppConfig(
    appEnvironment: appEnvironment,
    appName: appName,
    child: UncontrolledProviderScope(
      container: container,
      child: const MainApp(),
    ),
  );

  runApp(appConfig);
}
