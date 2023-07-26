import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{ projectName }}/core/router/page_routes/base_route_transition_page.dart';

enum PageRouteType { none, platform, fade, scale, slide, circular }

Page<T> createPage<T>({
  required Widget child,
  required GoRouterState state,
  bool fullscreenDialog = false,
}) {
  final transition = state.queryParameters['transition'] ?? 'platform';
  final pageRouteType = PageRouteType.values.byName(transition);

  switch (pageRouteType) {
    case PageRouteType.none:
      return NoTransitionPage(
        key: state.pageKey,
        child: child,
      );
    case PageRouteType.platform:
      return MaterialPage<T>(
        key: state.pageKey,
        child: child,
      );
    case PageRouteType.fade:
      return BaseRouteTransitionPage<T>.fade(
        child: child,
        state: state,
        fullscreenDialog: fullscreenDialog,
      );
    case PageRouteType.scale:
      return BaseRouteTransitionPage<T>.scale(
        child: child,
        state: state,
        fullscreenDialog: fullscreenDialog,
      );
    case PageRouteType.slide:
      return BaseRouteTransitionPage<T>.slide(
        child: child,
        state: state,
        fullscreenDialog: fullscreenDialog,
      );
    case PageRouteType.circular:
      return BaseRouteTransitionPage<T>.circular(
        child: child,
        state: state,
        fullscreenDialog: fullscreenDialog,
      );
  }
}
