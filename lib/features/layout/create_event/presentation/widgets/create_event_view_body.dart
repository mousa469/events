import 'package:events/features/layout/create_event/presentation/widgets/create_event%20_category_and_image.dart';
import 'package:events/features/layout/create_event/presentation/widgets/create_event_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEventViewBody extends StatelessWidget {
  const CreateEventViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CreateEventCategoryAndImage(),
          SizedBox(height: 16.h),
          CreateEventForm(),
        ],
      ),
    );
  }
}
