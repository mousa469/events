import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:events/features/layout/choose_event_location/presentation/views/choose_event_location_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventLocationButton extends StatelessWidget {
  const EventLocationButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeToggler>(context);
    return InkWell(
      onTap: () {
        context.pushNamed(routeName: ChooseEventLocationView.id);
      },
      child: Container(
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.all(12.h),
              child: Center(
                child: Icon(
                  Icons.my_location_sharp,
                  color: theme.isLight ? AppColors.white : AppColors.black,
                ),
              ),
            ),

            SizedBox(width: 8.w),

            Text(
              title,
              style: AppStyles.style16Medium.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
