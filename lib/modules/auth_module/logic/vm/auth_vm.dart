import 'package:learning_app/model/jhister_models.dart';
import 'package:learning_app/modules/auth_module/logic/services/auth_service.dart';

class AuthVM {
  final JhipsterAuthService authService;

  AuthVM({required this.authService});

  Future<bool> register(JhipsterRegisterUser user) =>
      authService.register(user);

  Future<bool> login(JhipsterLoginUser user) => authService.login(user);
}
