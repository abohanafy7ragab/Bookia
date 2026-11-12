import 'package:dio/dio.dart';

class DioExceptionHandler {
  DioExceptionHandler._();

  /// Converts any [DioException] into a readable message.
  static String handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out';
      case DioExceptionType.sendTimeout:
        return 'Send timed out';
      case DioExceptionType.receiveTimeout:
        return 'Receive timed out';
      case DioExceptionType.transformTimeout:
        return 'Data processing timed out';
      case DioExceptionType.badCertificate:
        return 'Invalid SSL certificate';
      case DioExceptionType.badResponse:
        return _handleBadResponse(e.response);
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.connectionError:
        return 'No internet connection';
      case DioExceptionType.unknown:
        return 'An unexpected error occurred';
    }
  }

  /// Routes the bad response to the right handler by status code.
  static String _handleBadResponse(Response? response) {
    final int? statusCode = response?.statusCode;

    if (statusCode == null) {
      return 'Invalid response from the server';
    }

    if (statusCode >= 300 && statusCode < 400) {
      return _handleRedirectionError(statusCode, response);
    } else if (statusCode >= 400 && statusCode < 500) {
      return _handleClientError(statusCode, response);
    } else if (statusCode >= 500) {
      return _handleServerError(statusCode, response);
    }

    return 'Unknown error occurred';
  }

  /// Status codes from 300 to 399.
  static String _handleRedirectionError(int statusCode, Response? response) {
    switch (statusCode) {
      case 301:
        return 'Resource moved permanently';
      case 302:
        return 'Resource moved temporarily';
      case 304:
        return 'Resource not modified';
      case 307:
        return 'Temporary redirect';
      case 308:
        return 'Permanent redirect';
      default:
        return 'Request was redirected';
    }
  }

  /// Status codes from 400 to 499.
  static String _handleClientError(int statusCode, Response? response) {
    // Try to use the message sent by the server first.
    final String? serverMessage = _extractServerMessage(response?.data);

    switch (statusCode) {
      case 400:
        return serverMessage ?? 'Bad request';
      case 401:
        return serverMessage ?? 'Unauthorized, please log in';
      case 403:
        return serverMessage ?? 'You do not have permission to access this';
      case 404:
        return serverMessage ?? 'Requested resource not found';
      case 405:
        return 'Method not allowed';
      case 408:
        return 'Request timed out';
      case 409:
        return serverMessage ?? 'Data conflict';
      case 422:
        return serverMessage ?? 'Unable to process the submitted data';
      case 429:
        return 'Too many requests, please try again later';
      default:
        return serverMessage ?? 'Client error occurred';
    }
  }

  /// Status codes 500 and above.
  static String _handleServerError(int statusCode, Response? response) {
    switch (statusCode) {
      case 500:
        return 'Internal server error';
      case 501:
        return 'Not implemented on the server';
      case 502:
        return 'Bad gateway';
      case 503:
        return 'Service unavailable';
      case 504:
        return 'Gateway timeout';
      default:
        return 'Server error, please try again later';
    }
  }

  /// Reads a message from the response body if the server sent one.
  static String? _extractServerMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      final message = data['message'] ?? data['error'] ?? data['msg'];
      if (message is String && message.isNotEmpty) return message;
    }
    return null;
  }
}