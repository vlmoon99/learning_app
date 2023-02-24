//Root module
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_app/modules/home_module/logic/services/content_service.dart';
import 'package:learning_app/modules/home_module/logic/vm/home_vm.dart';
import 'package:learning_app/modules/home_module/screens/home_page.dart';
import 'package:learning_app/network/interceptors/authorization_interceptor.dart';
import 'package:learning_app/network/interceptors/logging_interceptor.dart';
import 'package:learning_app/network/network_client.dart';
import 'package:learning_app/network/network_resource.dart';
import 'package:learning_app/routes/routes.dart';

class HomeModule extends Module {
  //Залежності (Dependecy)
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeVM(contentService: i())),
        Bind.singleton(
          (i) => ContentService(
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
      ];

  //Навігаційні путі (Routes)
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.home.startPage,
          child: (context, args) => HomePage(),
        ),
      ];
}
