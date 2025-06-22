import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:flutter/material.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({super.key, required this.city, required this.country});
  final String city;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: AppColors.white),
        Text(
          city,
          style: AppStyles.style14Medium.copyWith(color: AppColors.white),
        ),
        Text(
          ",",
          style: AppStyles.style14Medium.copyWith(color: AppColors.white),
        ),
        Text(
          country,
          style: AppStyles.style14Medium.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
