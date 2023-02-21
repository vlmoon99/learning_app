//Root module
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_app/modules/auth_module/auth_module.dart';
import 'package:learning_app/modules/home_module/home_module.dart';
import 'package:learning_app/routes/routes.dart';
import 'package:learning_app/theme/app_theme.dart';

class AppModule extends Module {
  //Залежності (Dependecy)
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AppTheme()),
      ];

  //Навігаційні путі (Routes)
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Routes.home.module, module: HomeModule()),
        ModuleRoute(Routes.auth.module, module: AuthModule()),
      ];
}
