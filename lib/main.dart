import 'package:events/constants.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/router/app_router.dart';
import 'package:events/core/services/hive_local_storage.dart';
import 'package:events/core/services/service_locator.dart';
import 'package:events/core/utilies/easy_loading.dart';
import 'package:events/core/utilies/event_info.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/core/utilies/language_toggler.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:events/features/authentication/presentation/views/sign_in_view.dart';
import 'package:events/features/layout/presentation/views/layout_view.dart';
import 'package:events/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:events/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getItSetup();
  CustomEasyLoading.easyLoadingSetup();
  await HiveLocalStorage.hiveConfig();
  await HiveLocalStorage.clearSpecficValues(key: Keys.eventsListInOfflineMode);

  runApp(const Evently());
}

class Evently extends StatefulWidget {
  const Evently({super.key});

  @override
  State<Evently> createState() => _EventlyState();
}

class _EventlyState extends State<Evently> {
  String getInitialRoute() {
    final localStorage = HiveLocalStorage();

    final wasOnboardingSeen = localStorage.getBool(
      key: Keys.isOnBoardingSeenBefore,
    );
    if (wasOnboardingSeen != true) {
      return OnBoardingView.id;
    }

    final wasSignedInBefore = localStorage.getBool(
      key: Keys.isAthenticatedBefore,
    );
    return (wasSignedInBefore == true) ? LayoutView.id : SignInView.id;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              LanguageToggler(localStorage: getIt<HiveLocalStorage>()),
        ),
        ChangeNotifierProvider(create: (context) => ThemeToggler()),
        ChangeNotifierProvider(create: (context) => EventInformation()),
      ],
      child: Builder(
        builder: (context) {
          var local = Provider.of<LanguageToggler>(context);
          var mode = Provider.of<ThemeToggler>(context);

          return ScreenUtilInit(
            designSize: Size(393, 841),
            minTextAdapt: true,
            child: MaterialApp(
              scaffoldMessengerKey: scaffoldMessengerKey,
              builder: EasyLoading.init(),
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
