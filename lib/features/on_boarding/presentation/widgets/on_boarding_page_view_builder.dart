import 'package:events/core/extensions/media_query_extension.dart';
import 'package:events/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:events/features/on_boarding/data/provider/on_boarding_current_index.dart';
import 'package:events/features/on_boarding/presentation/widgets/on_boarding_page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingPageViewBuilder extends StatelessWidget {
  const OnBoardingPageViewBuilder({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<OnBoardingCurrentIndex>(context);
    return SizedBox(
      height: context.screenHeight(.9),
      child: PageView.builder(
        
        controller: controller.pageController,
        itemCount: OnBoardingModel.getOnBoardingModels(context: context).length,
        itemBuilder: (context, index) {
          return OnBoardingPageViewItem(
            onBoardingModel: OnBoardingModel.getOnBoardingModels(
              context: context,
            )[index],
          );
        },
      ),
    );
  }
}
