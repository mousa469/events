import 'package:events/core/assets/app_assets.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventMapItem extends StatelessWidget {
  const EventMapItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.41,
      child: Container(
        margin: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: AppColors.secondaryWhite,

          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primaryColor),
        ),
        padding: EdgeInsets.all(8.r),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1.76,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.SportCategory),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.primaryColor),
                ),
              ),
            ),

            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      "Meeting for Updating The Development Method ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppStyles.style14Bold.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        Expanded(
                          child: Text(
                            maxLines: 1,
                            "Cairo, Egypt",
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.style14Bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
