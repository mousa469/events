import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/services/custom_flutter_secure_storage.dart';
import 'package:events/core/services/hive_local_storage.dart';
import 'package:events/core/services/service_locator.dart';
import 'package:events/features/authentication/data/repos/authentication_repo_impl.dart';
import 'package:events/features/authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:events/features/authentication/presentation/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String id = "signUpView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        authenticationRepo: getIt<AuthenticationRepoImpl>(),
        localStorage: getIt<HiveLocalStorage>(),
        secureLocalStorage: getIt<CustomFlutterSecureStorage>(),
      ),
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(S.of(context).register)),
        body: SignUpViewBody(),
      ),
    );
  }
}
