import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/widgets/custom_snack_bar.dart';
import 'package:events/features/layout/create_event/presentation/cubits/create_event/create_event_cubit.dart';
import 'package:events/features/layout/create_event/presentation/widgets/create_event%20_category_and_image.dart';
import 'package:events/features/layout/create_event/presentation/widgets/create_event_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEventViewBody extends StatelessWidget {
  const CreateEventViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateEventCubit, CreateEventState>(
      listener: (context, state) {
        if (state is CreateEventSuccess) {
          CustomSnackBar(
            context: context,
            subTitle: S.of(context).event_created_successfully,
            title: S.of(context).success,
            type: SnackBarType.success,
          );
          EasyLoading.dismiss();
        }

        if (state is CreateEventFailure) {
          EasyLoading.dismiss();

          CustomSnackBar(
            context: context,
            subTitle: state.errMessage,
            title: S.of(context).oops,
            type: SnackBarType.failure,
          );
        }

        if (state is CreateEventLoading) {
          EasyLoading.show();
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            CreateEventCategoryAndImage(),
            SizedBox(height: 16.h),
            CreateEventForm(),
          ],
        ),
      ),
    );
  }
}
