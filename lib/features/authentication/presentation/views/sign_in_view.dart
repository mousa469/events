import 'package:events/core/services/custom_flutter_secure_storage.dart';
import 'package:events/core/services/hive_local_storage.dart';
import 'package:events/core/services/service_locator.dart';
import 'package:events/features/authentication/data/repos/authentication_repo_impl.dart';
import 'package:events/features/authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:events/features/authentication/presentation/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  static const String id = "signInView";

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        authenticationRepo: getIt<AuthenticationRepoImpl>(),
        localStorage: getIt<HiveLocalStorage>(),
        secureLocalStorage: getIt<CustomFlutterSecureStorage>(),
      ),
      child: Scaffold(body: SignInViewBody()),
    );
  }
}
