import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/features/authentication/presentation/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String id = "signUpView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(S.of(context).register)),
      body: SignUpViewBody(),
    );
  }
}
