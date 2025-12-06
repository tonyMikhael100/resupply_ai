import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  //for singleton pattern to prevent more than one object from DioFactory class
  static final DioFactory _instance = DioFactory._internal();
  factory DioFactory() => _instance;
  DioFactory._internal();

  Dio? _dio;

  /// Initialize Dio instance (singleton)
  Future<Dio> getDio({required String baseUrl}) async {
    if (_dio != null) return _dio!;

    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Api-Key': 'nDhrXjtdTqMR5R1Mj1szEg==VDssdEjBgCOBSfLu'
      },
    );

    final dio = Dio(baseOptions);
    // --------------------------------------------------
    // 🧩 Interceptors
    // --------------------------------------------------

    // 🧾 Add pretty logging only in debug mode
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }

    _dio = dio;
    return _dio!;
  }
}
