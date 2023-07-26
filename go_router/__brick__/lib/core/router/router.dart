import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{ projectName }}/core/router/page_routes/page_route_type.dart';
import 'package:{{ projectName }}/core/router/redirect.dart';
import 'package:{{ projectName }}/core/router/router_listenable.dart';
import 'package:{{ projectName }}/features/home/presentation/home_screen.dart';
import 'package:{{ projectName }}/features/settings/presentation/settings_screen.dart';
import 'package:{{ projectName }}/shared/widgets/base_scaffold_with_nav_bar.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

@riverpod
GoRouter router(RouterRef ref) {
  final userState = ref.watch(routerListenableProvider);
  final routerListenable = ref.watch(routerListenableProvider.notifier);
  final routes = ref.watch(routesProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: routerListenable,
    routes: routes,
    redirect: (context, state) => handleRedirect(
      ref: ref,
      context: context,
      state: state,
      userState: userState,
    ),
  );
}

@riverpod
List<RouteBase> routes(RoutesRef ref) {
  return [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return BaseScaffoldWithNavBar(
          child: child,
        );
      },
      routes: [
        GoRoute(
          name: HomeScreen.name,
          path: HomeScreen.path,
          pageBuilder: (_, state) => createPage(
            state: state,
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          name: SettingsScreen.name,
          path: SettingsScreen.path,
          pageBuilder: (_, state) => createPage(
            state: state,
            child: const SettingsScreen(),
          ),
        ),
      ],
    ),
  ];
}
