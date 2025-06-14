import 'package:events/core/assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.brandHeader, width: 200.w, height: 100.h);
  }
}
