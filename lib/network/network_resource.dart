import 'package:dio/dio.dart';

class NetworkResource {
  final String baseUrl;
  final List<Interceptor> interceptors;
  int connectTimeout;
  int receiveTimeout;

  NetworkResource({
    required this.baseUrl,
    required this.interceptors,
    this.connectTimeout = 5000,
    this.receiveTimeout = 3000,
  });
}
