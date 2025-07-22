import 'package:events/core/services/service_locator.dart';
import 'package:events/features/layout/more/data/cubits/cubit/sign_out_cubit.dart';
import 'package:events/features/layout/more/data/repos/more_repo_impl.dart';
import 'package:events/features/layout/more/presentation/widgets/more_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  static const String id = "profileView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(moreRepo: getIt<MoreRepoImpl>()),
      child: const Scaffold(body: MoreViewBody()),
    );
  }
}
