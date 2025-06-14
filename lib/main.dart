import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/router/app_router.dart';
import 'package:events/core/utilies/language_toggler.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:events/features/authentication/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Evently());
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageToggler()),
        ChangeNotifierProvider(create: (context) => ThemeToggler()),
      ],
      child: Builder(
        builder: (context) {
          var local = Provider.of<LanguageToggler>(context);
          var mode = Provider.of<ThemeToggler>(context);

          return ScreenUtilInit(
            designSize: Size(393, 841),
            minTextAdapt: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'Flutter Demo',
              locale: local.locale,
              theme: mode.appTheme,
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: SignInView.id,
            ),
          );
        },
      ),
    );
  }
}
