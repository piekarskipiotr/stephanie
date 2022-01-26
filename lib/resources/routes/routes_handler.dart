import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stephanie/screens/conceal_form/ui/conceal_form.dart';
import 'package:stephanie/screens/home/ui/home.dart';
import 'package:stephanie/screens/reveal_form/ui/reveal_form.dart';
import 'app_routes.dart';

class RoutesHandler {
  Route? getRoute(RouteSettings settings) {
    log('Routing to: ${settings.name}', name: '$runtimeType');

    switch (settings.name) {
      case AppRoutes.home:
        return buildRoute(const Home(), settings: settings);
      case AppRoutes.concealForm:
        return buildRoute(const ConcealForm(), settings: settings);
      case AppRoutes.revealForm:
        return buildRoute(const RevealForm(), settings: settings);
    }
  }

  MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => child,
    );
  }
}
