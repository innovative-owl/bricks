import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{ projectName }}/core/router/page_routes/page_route_type.dart';
import 'package:{{ projectName }}/features/home/presentation/home_screen.dart';
import 'package:{{ projectName }}/features/settings/presentation/settings_screen.dart';

const destinations = [
  NavigationDestination(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  NavigationDestination(
    icon: Icon(Icons.settings_outlined),
    label: 'Settings',
  ),
];

class BaseScaffoldWithNavBar extends StatelessWidget {
  const BaseScaffoldWithNavBar({
    super.key,
    required this.child,
  });

  final Widget child;

  static int _calculateSelectedIndex(BuildContext context) {
    final route = GoRouterState.of(context);
    final location = route.location;
    if (location.startsWith(HomeScreen.path)) {
      return 0;
    }
    if (location.startsWith(SettingsScreen.path)) {
      return 1;
    }

    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    final queryParams = {'transition': PageRouteType.none.name};

    switch (index) {
      case 0:
        GoRouter.of(context).goNamed(
          HomeScreen.name,
          queryParameters: queryParams,
        );
        break;
      case 1:
        GoRouter.of(context).goNamed(
          SettingsScreen.name,
          queryParameters: queryParams,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        destinations: destinations,
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (index) => _onItemTapped(index, context),
      ),
    );
  }
}
