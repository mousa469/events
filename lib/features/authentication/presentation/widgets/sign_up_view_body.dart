import 'package:events/features/authentication/presentation/widgets/portrait_sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return PortraitSignUpViewBody();
        } else {
          return Placeholder();
        }
      },
    );
  }
}