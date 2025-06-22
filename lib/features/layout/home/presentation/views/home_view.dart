import 'package:events/features/layout/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = "homeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody());
  }
}
