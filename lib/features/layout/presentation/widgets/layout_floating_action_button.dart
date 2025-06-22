import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:events/features/layout/create_event/presentation/views/create_event_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutFloatingActionButton extends StatelessWidget {
  const LayoutFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeToggler>(context);
    return InkWell(
      onTap: () {
        context.pushNamed(routeName: CreateEventView.id);
      },
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 30,
        child: CircleAvatar(
          backgroundColor: theme.isLight
              ? AppColors.primaryColor
              : AppColorsDarkMode.primaryColor,
          radius: 25,
          child: Icon(Icons.add, color: AppColors.white, size: 40),
        ),
      ),
    );
  }
}
