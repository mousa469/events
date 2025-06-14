import 'package:events/features/on_boarding/presentation/widgets/portrait_welcome_view_body.dart';
import 'package:flutter/material.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return PortraitWelcomeViewBody();
        } else {
            return PortraitWelcomeViewBody();
        }
      },
    );
  }
}
