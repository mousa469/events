import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/models/event_category_model.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventCategory extends StatelessWidget {
  const EventCategory({
    super.key,
    required this.eventCategoryModel,
    required this.isSelected,
  });
  final EventCategoryModel eventCategoryModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeToggler>(context, listen: false);

    final borderColor = getBorderColor(theme);
    final iconAndTextColor = getIconAndTextColor(theme);
    final containerColor = getContainerColor(theme);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        color: containerColor,

        borderRadius: BorderRadius.circular(46.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(eventCategoryModel.icon, color: iconAndTextColor),
            SizedBox(width: 12.w),
            Text(
              eventCategoryModel.title,
              style: AppStyles.style16Medium.copyWith(color: iconAndTextColor),
            ),
          ],
        ),
      ),
    ).customePadding(right: 10.w);
  }

  Color getBorderColor(ThemeToggler theme) {
    if (isSelected) return Colors.transparent;
    return theme.isLight ? AppColors.white : AppColors.primaryColor;
  }

  Color getIconAndTextColor(ThemeToggler theme) {
    if (isSelected) {
      return theme.isLight ? AppColors.primaryColor : AppColors.white;
    }
    return AppColors.white;
  }

  Color getContainerColor(ThemeToggler theme) {
    if (isSelected) {
      if (theme.isLight) {
        return AppColors.white;
      } else {
        return AppColors.primaryColor;
      }
    } else {
      return Colors.transparent;
    }
  }
}
