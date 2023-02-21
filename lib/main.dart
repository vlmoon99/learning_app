import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/modules/app_module.dart';
import 'package:learning_app/routes/routes.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

//Root widget
class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    Modular.setInitialRoute(Routes.auth.getModule());

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
        );
      },
    );
  }
}
