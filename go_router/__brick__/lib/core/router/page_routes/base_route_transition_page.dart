import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{ projectName }}/core/router/page_routes/circular_reveal_clipper.dart';

class BaseRouteTransitionPage<T> extends CustomTransitionPage<T> {
  BaseRouteTransitionPage.fade({
    required super.child,
    required super.fullscreenDialog,
    required GoRouterState state,
  }) : super(
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );

  BaseRouteTransitionPage.scale({
    required super.child,
    required super.fullscreenDialog,
    required GoRouterState state,
  }) : super(
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(scale: animation, child: child);
          },
        );

  BaseRouteTransitionPage.slide({
    required super.child,
    required super.fullscreenDialog,
    required GoRouterState state,
  }) : super(
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation.drive(
                Tween<double>(
                  begin: .4,
                  end: 1.0,
                ).chain(CurveTween(curve: Curves.easeIn)),
              ),
              child: SlideTransition(
                position: animation.drive(
                  Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn)),
                ),
                child: child,
              ),
            );
          },
        );

  BaseRouteTransitionPage.circular({
    required super.child,
    required super.fullscreenDialog,
    required GoRouterState state,
    centerAlignment = Alignment.center,
    centerOffset,
  }) : super(
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ClipPath(
              clipper: CircularRevealClipper(
                fraction: animation.value,
                centerAlignment: centerAlignment,
                centerOffset: centerOffset,
                minRadius: 0,
                maxRadius: 800,
              ),
              child: child,
            );
          },
        );
}
