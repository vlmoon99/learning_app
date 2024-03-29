import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:learning_app/exceptions/exceptions.dart';
import 'package:learning_app/network/network_resource.dart';

class NetworkClient {
  late Dio _dio;
  // final Catcher catcher;
  final NetworkResource networkResource;

  NetworkClient(this.networkResource) {
    _dio = Dio();
    _dio.options.baseUrl = networkResource.baseUrl;
    _dio.options.connectTimeout =
        Duration(seconds: networkResource.connectTimeout);
    _dio.options.receiveTimeout =
        Duration(seconds: networkResource.receiveTimeout);

    for (var element in networkResource.interceptors) {
      _dio.interceptors.add(element);
    }
  }

  AppExceptions _handleError(DioError e) {
    final details = jsonDecode(e.response!.data)['detail'];
    final exception = AppExceptions(
        messageForUser: details,
        messageForDev: e.error.toString(),
        statusCode: e.response!.statusCode!);
    // catcher.exceptionsHandler.add(exception);
    return exception;
  }

  Future<ApiResponse> getRequest(String url) async {
    AppExceptions? appExceptions;
    try {
      Response response = await _dio.get(url);
      return ApiResponse.success(response.data, response.statusCode!, true);
    } on DioError catch (e) {
      appExceptions = _handleError(e);
    }
    return ApiResponse.error(
        appExceptions.messageForDev, appExceptions.statusCode, false);
  }

  Future<ApiResponse> postHTTP(String url, dynamic data) async {
    AppExceptions? appExceptions;

    try {
      Response response = await _dio.post(
        url,
        data: data,
      );
      return ApiResponse.success(response.data, response.statusCode!, true);
    } on DioError catch (e) {
      appExceptions = _handleError(e);
    }
    return ApiResponse.error(
        appExceptions.messageForDev, appExceptions.statusCode, false);
  }

  Future<ApiResponse> putHTTP(String url, dynamic data) async {
    AppExceptions? appExceptions;

    try {
      Response response = await _dio.put(url, data: data);
      return ApiResponse.success(response.data, response.statusCode!, true);
    } on DioError catch (e) {
      appExceptions = _handleError(e);
    }
    return ApiResponse.error(
        appExceptions.messageForDev, appExceptions.statusCode, false);
  }

  Future<ApiResponse> deleteHTTP(String url, dynamic data) async {
    AppExceptions? appExceptions;

    try {
      Response response = await _dio.delete(url, data: data);
      return ApiResponse.success(response.data, response.statusCode!, true);
    } on DioError catch (e) {
      appExceptions = _handleError(e);
    }

    return ApiResponse.error(
        appExceptions.messageForDev, appExceptions.statusCode, false);
  }
}

class ApiResponse {
  ApiResponse.success(this.data, this.statusCode, this.isSucsess);
  ApiResponse.error(this.data, this.statusCode, this.isSucsess);

  dynamic data;
  int statusCode;
  bool isSucsess;
}
