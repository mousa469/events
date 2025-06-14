import 'package:events/features/authentication/presentation/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String id = "signInView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInViewBody(),
    );
  }
}
