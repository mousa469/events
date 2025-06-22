import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget {
  final String label;

  const FieldLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textAlign: TextAlign.start,
          label,
          style: AppStyles.style16Medium,
        ),
      ],
    );
  }
}
