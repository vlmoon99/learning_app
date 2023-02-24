import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<bool> checkIfUserAuthorized() async {
  const storage = FlutterSecureStorage();
  String? value = await storage.read(key: 'token');
  final response = value == null ? false : true;
  return response;
}
