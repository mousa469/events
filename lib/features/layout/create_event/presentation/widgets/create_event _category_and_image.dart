import 'package:events/constants.dart';
import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/models/event_category_model.dart';
import 'package:events/core/utilies/event_info.dart';
import 'package:events/features/layout/create_event/presentation/widgets/create_new_event_category_item.dart';
import 'package:events/features/layout/create_event/presentation/widgets/event_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateEventCategoryAndImage extends StatefulWidget {
  const CreateEventCategoryAndImage({super.key});

  @override
  State<CreateEventCategoryAndImage> createState() =>
      _CreateEventCategoryAndImageState();
}

class _CreateEventCategoryAndImageState
    extends State<CreateEventCategoryAndImage> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var eventInfo = Provider.of<EventInformation>(context);
    return Column(
      children: [
        Container(
          height: 300.h,
          // color: Colors.red,
          child: PageView.builder(
            controller: pageController,
            itemCount: EventCategories.length,
            itemBuilder: (context, index) {
              return EventImage(img: EventCategories[index]);
            },
          ),
        ).horizontalPadding(value: 16.w),

        SizedBox(height: 16.h),

        Container(
          height: 50.h,
          child: ListView.builder(
            itemCount: EventCategoryModel.createEventCategories(
              context: context,
            ).length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    eventInfo.Index = index;
                  });

                  pageController.jumpToPage(currentIndex);
                },
                child: CreateNewEventCategoryItem(
                  eventCategoryModel: EventCategoryModel.createEventCategories(
                    context: context,
                  )[index],
                  isSelected: currentIndex == index,
                ),
              );
            },
          ),
        ).customePadding(left: 16.w),
      ],
    );
  }
}
