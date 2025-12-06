import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService({Dio? dio}) : _dio = dio ?? Dio(_baseOptions);

  static BaseOptions get _baseOptions => BaseOptions(
        baseUrl: 'https://example.com/api/',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

  /// GET Request
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var response = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: options,
    );
    var jsonData = jsonDecode(response.data);
    return jsonData;
  }

  /// POST Request
  Future<dynamic> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// PUT Request
  Future<Response> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// DELETE Request
  Future<Response> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// Add Authorization Token
  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// Remove Token
  void clearToken() {
    _dio.options.headers.remove('Authorization');
  }
}
