import 'package:events/features/on_boarding/data/provider/on_boarding_current_index.dart';
import 'package:events/features/on_boarding/presentation/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String id = "onBoardingView";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardingCurrentIndex(),
      child: Scaffold(body: OnBoardingViewBody()),
    );
  }
}
