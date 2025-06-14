import 'package:events/core/assets/app_assets.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Switcher extends StatefulWidget {
  const Switcher({
    super.key,
    required this.title,
    required this.leftItem,
    required this.rightItem,
    this.leftItemOnClick,
    this.RightItemOnClick,
    required this.isLeft,
  });

  final String title;
  final Widget leftItem;
  final Widget rightItem;
  final void Function()? leftItemOnClick;
  final void Function()? RightItemOnClick;
  final bool isLeft;

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: AppStyles.style20Medium.copyWith(
            color: AppColors.primaryColor,
          ),
        ),

        Spacer(),

        Container(
          width: 80.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primaryColor),
            color: Colors.transparent,
            shape: BoxShape.rectangle,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: widget.leftItemOnClick,
                child: FittedBox(
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: widget.isLeft
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    child: widget.leftItem,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: widget.RightItemOnClick,
                child: FittedBox(
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: widget.isLeft
                        ? Colors.transparent
                        : AppColors.primaryColor,
                    child: widget.rightItem,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
