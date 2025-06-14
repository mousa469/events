import 'package:events/features/authentication/presentation/views/sign_in_view.dart';
import 'package:events/features/authentication/presentation/views/sign_up_view.dart';
import 'package:events/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:events/features/on_boarding/presentation/views/welcome_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
 static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
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
