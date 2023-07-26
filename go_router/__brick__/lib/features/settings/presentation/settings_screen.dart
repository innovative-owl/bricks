import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const name = 'settings';
  static const path = '/settings';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Screen'),
    );
  }
}
