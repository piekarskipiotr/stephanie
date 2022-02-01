import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stephanie/data/models/conceal.dart';
import 'package:stephanie/data/models/reveal.dart';
import 'package:stephanie/screens/conceal_form/bloc/conceal_form_cubit.dart';
import 'package:stephanie/screens/conceal_form/ui/conceal_form.dart';
import 'package:stephanie/screens/home/ui/home.dart';
import 'package:stephanie/screens/reveal_form/bloc/reveal_form_cubit.dart';
import 'package:stephanie/screens/reveal_form/ui/reveal_form.dart';
import 'app_routes.dart';

class RoutesHandler {
  Route? getRoute(RouteSettings settings) {
    log('Routing to: ${settings.name}', name: '$runtimeType');

    switch (settings.name) {
      case AppRoutes.home:
        return buildRoute(const Home(), settings: settings);
      case AppRoutes.concealForm:
        return buildRoute(
          BlocProvider(
            create: (_) => ConcealFormCubit(),
            child: ConcealForm(
              conceal: Conceal(
                containerImage: null,
                secret: null,
                output: null,
              ),
            ),
          ),
          settings: settings,
        );
      case AppRoutes.revealForm:
        return buildRoute(
          BlocProvider(
            create: (_) => RevealFormCubit(),
            child: RevealForm(
              reveal: Reveal(
                image: null,
                output: null,
              ),
            ),
          ),
          settings: settings,
        );
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
