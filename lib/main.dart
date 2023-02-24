import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/assets/localizations.dart';
import 'package:learning_app/modules/app_module.dart';
import 'package:learning_app/routes/routes.dart';
import 'package:learning_app/utils/utils.dart';

// void main() async {
//   LicenseRegistry.addLicense(() async* {});
//   WidgetsFlutterBinding.ensureInitialized();

//   await EasyLocalization.ensureInitialized();

//   return runApp(ModularApp(module: AppModule(), child: AppWidget()));
// }

void main() {
  runZonedGuarded(() async {
    LicenseRegistry.addLicense(() async* {
      final license =
          await rootBundle.loadString('assets/google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['assets/google_fonts'], license);
    });

    WidgetsFlutterBinding.ensureInitialized();

    await EasyLocalization.ensureInitialized();
    //Catch Errors caught by Flutter
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      log("Catch Error from FlutterError $details");

      //TODO add catcher
    };
    final isAuthorized = await checkIfUserAuthorized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then(
      (value) => runApp(
        EasyLocalization(
          supportedLocales: const [
            Locale('en'),
          ],
          path: LocalizationsStrings.localizationPath,
          fallbackLocale: const Locale('en'),
          child: ModularApp(
            module: AppModule(),
            child: AppWidget(isAuthorized: isAuthorized),
          ),
        ),
      ),
    );
  }, (error, stack) {
    log("Catch Error from Zone $error");
    //Catch Errors not caught by Flutter
    //TODO add catcher
  });
}

//Root widget
class AppWidget extends StatelessWidget {
  const AppWidget({required this.isAuthorized, super.key});
  final bool isAuthorized;
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(isAuthorized
        ? Routes.home.getModule()
        : Routes.auth.getRoute(Routes.auth.signup));

    //MaterialApp - це віджет який дає встроєну моливість навігації , також дає відчуття нативної
    //платформи
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      // splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          title: 'Learning App',
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
