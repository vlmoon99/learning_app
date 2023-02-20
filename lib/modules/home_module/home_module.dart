//Root module
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_app/modules/home_module/screens/home_page.dart';
import 'package:learning_app/routes/routes.dart';

class HomeModule extends Module {
  //Залежності (Dependecy)
  @override
  List<Bind> get binds => [];

  //Навігаційні путі (Routes)
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.home.startPage,
          child: (context, args) => HomePage(),
        ),
      ];
}
