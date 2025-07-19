import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.height,
    required this.title,
    required this.backgroundColor,
    required this.borderRadius,
    required this.width,
    required this.onPressed,
  });
  final double? height;
  final Widget title;
  final Color backgroundColor;
  final double borderRadius;
  final double width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 0,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(borderRadius),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: title,
      ),
    );
  }
}
