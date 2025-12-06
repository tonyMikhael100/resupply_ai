import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  /// Factory constructor to convert Dio exceptions into human-readable messages
  factory ServerFailure.dioErrorHandler(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: 'Connection timeout, please try again later.',
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMessage: 'Request timeout, please try again later.',
        );

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMessage: 'Server took too long to respond, try again later.',
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          errorMessage: 'Request was cancelled, please try again.',
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMessage: 'Bad SSL certificate, please check your network.',
        );

      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage: 'No internet connection, please check your network.',
        );
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = _handleBadResponse(statusCode, error.response?.data);
        return ServerFailure(errorMessage: message);
      case DioExceptionType.unknown:
      default:
        return ServerFailure(
          errorMessage: 'Unexpected error occurred, please try again later.',
        );
    }
  }

  /// Helper to interpret API error responses based on status code or message
  static String _handleBadResponse(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return 'Bad request, please check your input.';
      case 401:
        return 'Unauthorized, please login again.';
      case 403:
        return 'Access denied, you don’t have permission.';
      case 404:
        return 'Requested resource not found.';
      case 409:
        return 'Conflict occurred, please try again.';
      case 500:
        return 'Server error, please try again later.';
      case 503:
        return 'Server unavailable, please try again later.';
      default:
        // Try to extract a readable message from response body
        if (data is Map && data['message'] != null) {
          return data['message'].toString();
        }
        return 'Something went wrong (${statusCode ?? 'unknown error'}).';
    }
  }
}
