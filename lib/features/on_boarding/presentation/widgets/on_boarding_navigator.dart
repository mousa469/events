import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class OnBoardingNavigator extends StatelessWidget {
  const OnBoardingNavigator({super.key, required this.icon, required this.onTap});
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, color: AppColors.primaryColor),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
