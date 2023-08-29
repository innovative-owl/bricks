import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:{{ projectName }}/app_config.dart';

Future<void> configureFirebase(env) async {
  if (env == AppEnvironment.local) {
    await configureEmulators();
  }

  FirebaseAnalytics.instance.logAppOpen();
}

Future<void> configureEmulators() async {
  const authPort = 9099;
  const firestorePort = 8082;
  const functionsPort = 5002;
  const storagePort = 9199;

  if (kDebugMode) {
    var host = 'localhost';
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        host = '10.0.2.2';
      }
    }

    await FirebaseAuth.instance.useAuthEmulator(host, authPort);
    FirebaseFirestore.instance.useFirestoreEmulator(host, firestorePort);
    FirebaseFunctions.instance.useFunctionsEmulator(host, functionsPort);
    await FirebaseStorage.instance.useStorageEmulator(host, storagePort);

    // logger.i([
    //   'Running Firebase Auth Emulator at $host:$authPort',
    //   'Running Firebase Firestore Emulator at $host:$firestorePort',
    //   'Running Firebase Functions Emulator at $host:$functionsPort',
    //   'Running Firebase Storage Emulator at $host:$storagePort',
    // ]);
  }
}
