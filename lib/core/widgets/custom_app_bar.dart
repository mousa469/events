import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.actions});
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back, color: AppColors.primaryColor),
      ),
      title: Text(
        title,
        style: AppStyles.style20Bold.copyWith(color: AppColors.primaryColor),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
