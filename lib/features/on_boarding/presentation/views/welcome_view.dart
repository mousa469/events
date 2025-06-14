import 'package:events/features/on_boarding/presentation/widgets/welcome_view_body.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});
  static const String id = "welcomeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WelcomeViewBody());
  }
}
