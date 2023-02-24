//Root module
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_app/main.dart';
import 'package:learning_app/modules/auth_module/logic/services/auth_service.dart';
import 'package:learning_app/modules/auth_module/logic/vm/auth_vm.dart';
import 'package:learning_app/modules/auth_module/screens/login_screen.dart';
import 'package:learning_app/modules/auth_module/screens/sign_up_screen.dart';
import 'package:learning_app/network/interceptors/authorization_interceptor.dart';
import 'package:learning_app/network/interceptors/logging_interceptor.dart';
import 'package:learning_app/network/network_client.dart';
import 'package:learning_app/network/network_resource.dart';
import 'package:learning_app/routes/routes.dart';

class AuthModule extends Module {
  //Залежності (Dependecy)
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => JhipsterAuthService(
            secureStorage: i(),
            networkClient: NetworkClient(
              NetworkResource(
                baseUrl: 'http://10.0.2.2:8080/api',
                interceptors: [
                  LoggingInterceptor(),
                  AuthorizationInterceptor(),
                ],
              ),
            ),
          ),
        ),
        Bind.singleton((i) => AuthVM(authService: i())),
      ];

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
