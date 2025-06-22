import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/widgets/event_card.dart';
import 'package:events/features/layout/home/presentation/widgets/home_view_body_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeViewBodyHeader(),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.h);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return EventCard();
            },
          ).horizontalPadding(value: 16.w),
        ),
      ],
    );
  }
}
