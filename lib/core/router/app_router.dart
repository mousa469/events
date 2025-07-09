import 'dart:developer';
import 'package:events/features/authentication/presentation/views/sign_in_view.dart';
import 'package:events/features/authentication/presentation/views/sign_up_view.dart';
import 'package:events/features/layout/choose_event_location/presentation/views/choose_event_location_view.dart';
import 'package:events/features/layout/create_event/presentation/views/create_event_view.dart';
import 'package:events/features/layout/presentation/views/layout_view.dart';
import 'package:events/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:events/features/on_boarding/presentation/views/welcome_view.dart';
import 'package:events/features/layout/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    log(" the initial route in app router is : ${settings.name}");
    switch (settings.name) {
      case WelcomeView.id:
        return MaterialPageRoute(
          builder: (context) {
            return WelcomeView();
          },
        );
      case SignUpView.id:
        return MaterialPageRoute(
          builder: (context) {
            return SignUpView();
          },
        );
      case OnBoardingView.id:
        return MaterialPageRoute(
          builder: (context) {
            return OnBoardingView();
          },
        );
      case SignInView.id:
        return MaterialPageRoute(
          builder: (context) {
            return SignInView();
          },
        );
      case HomeView.id:
        return MaterialPageRoute(
          builder: (context) {
            return HomeView();
          },
        );
      case ChooseEventLocationView.id:
        return MaterialPageRoute(
          builder: (context) {
            return ChooseEventLocationView();
          },
        );
      case LayoutView.id:
        return MaterialPageRoute(
          builder: (context) {
            return LayoutView();
          },
        );
      case CreateEventView.id:
        return MaterialPageRoute(
          builder: (context) {
            return CreateEventView();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(child: Text("no route exist for this string ")),
            );
          },
        );
    }
  }
}
