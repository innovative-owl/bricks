import 'package:{{ projectName }}/app_config.dart';
import 'package:{{ projectName }}/firebase_options.dart';
import 'package:{{ projectName }}/init_app.dart';

void main() => initAndRunApp(
      appEnvironment: AppEnvironment.local,
      appName: '{{ projectName }}',
      firebaseOptions: DefaultFirebaseOptions.currentPlatform,
    );
