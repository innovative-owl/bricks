import 'package:{{ projectName }}/app_config.dart';
import 'package:{{ projectName }}/firebase_options_dev.dart';
import 'package:{{ projectName }}/init_app.dart';

void main() => initAndRunApp(
      appEnvironment: AppEnvironment.local,
      appName: '[Local] {{ projectName }}',
      firebaseOptions: DefaultFirebaseOptions.currentPlatform,
    );
