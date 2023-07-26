import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{ projectName }}/core/router/router_listenable.dart';

Future<String?>? handleRedirect({
  required Ref ref,
  required BuildContext context,
  required GoRouterState state,
  required UserState userState,
}) async {
  if (userState == UserState.signedOut) {
    // redirect to sign in
  }

  // no need to redirect at all
  return null;
}
