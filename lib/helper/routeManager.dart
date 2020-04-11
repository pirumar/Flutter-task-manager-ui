import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_manager/pages/home/homePage.dart';
import 'package:task_manager/pages/profile/profile.dart';

class RouteManager {
  static PageTransitionType _transitionType = PageTransitionType.fade;
  static Route<dynamic> generateRoute(RouteSettings settings,
      {PageTransitionType transitionType}) {
    if (transitionType == null) transitionType = _transitionType;
    switch (settings.name) {
      case homeRoute:
        return PageTransition(
          child: HomePage(),
          type: transitionType,
          settings: settings,
        );
      case profileRoute:
        return PageTransition(
          child: ProfilePage (),
          type: transitionType,
          settings: settings,
        );
      // case detailRoute:
      //   return PageTransition(
      //     child: FullPageDetail(),
      //     type: transitionType,
      //     settings: settings,
      //   );
      default:
        return PageTransition(
          child: Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
          type: transitionType,
          settings: settings,
        );
    }
  }
}

const String homeRoute = '/';
const String profileRoute = '/profile';
