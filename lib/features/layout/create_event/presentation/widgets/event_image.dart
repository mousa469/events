import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventImage extends StatelessWidget {
  const EventImage({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill),
      ),
    );
  }
}
