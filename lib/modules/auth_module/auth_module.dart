//Root module
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_app/main.dart';
import 'package:learning_app/modules/auth_module/screens/login_screen.dart';
import 'package:learning_app/modules/auth_module/screens/sign_up_screen.dart';
import 'package:learning_app/routes/routes.dart';

class AuthModule extends Module {
  //Залежності (Dependecy)
  @override
  List<Bind> get binds => [];

  //Навігаційні путі (Routes)
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.auth.login,
          child: (context, args) => const LoginScreen(),
        ),
        ChildRoute(
          Routes.auth.signup,
          child: (context, args) => const SignUpScreen(),
        ),
      ];
}
