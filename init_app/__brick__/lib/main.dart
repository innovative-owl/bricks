import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{ projectName }}/app_config.dart';
import 'package:{{ projectName }}/core/router/router.dart';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';


class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = AppConfig.of(context);
    final isMacOS = Theme.of(context).platform == TargetPlatform.macOS;
    final enabled = config.isLocal && kIsWeb || isMacOS;

    return DevicePreview(
      enabled: enabled,
      tools: [
        ...DevicePreview.defaultTools,
        if (!kIsWeb) ...[
          DevicePreviewScreenshot(
            onScreenshot: (context, screenshot) {
              // log.wtf('Screenshot saved to ${Directory.current}');
              return screenshotAsFiles(Directory.current)(context, screenshot);
            },
          ),
        ],
      ],
      builder: (context) {
        return MaterialApp.router(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: config.isProd,
          title: config.appName,
          routerConfig: ref.watch(routerProvider),
        );
      },
    );
  }
}
