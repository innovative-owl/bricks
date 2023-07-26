import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home';
  static const path = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Screen'),
    );
  }
}
