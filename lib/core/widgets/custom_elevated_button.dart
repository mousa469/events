import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.borderRadius,
    required this.width,
    required this.onPressed,
     required this.textStyle,
  });
  final String title;
  final Color backgroundColor;
  final double borderRadius;
  final double width;
  final void Function() onPressed;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(borderRadius),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
