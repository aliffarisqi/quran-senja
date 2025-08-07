import 'package:dio/dio.dart';

import 'logger_interceptors.dart';

/// A wrapper class around the Dio library to handle API calls.
///
/// This class provides a centralized client for making HTTP requests (GET, POST, PUT, DELETE)
/// with a predefined base URL, headers, timeouts, and interceptors.
class DioClient {
  // The Dio instance for making HTTP requests.
  late final Dio _dio;

  DioClient()
      : _dio = Dio(
          // Base options for the Dio instance.
          BaseOptions(
            // Headers to be sent with every request.
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            // The expected response type.
            responseType: ResponseType.json,
            // Timeout duration for sending requests.
            sendTimeout: const Duration(seconds: 10),
            // Timeout duration for receiving responses.
            receiveTimeout: const Duration(seconds: 10),
          ),
        )
          // Add interceptors to the Dio instance.
          ..interceptors.addAll([
            LoggerInterceptor(),
          ]);

  /// Handles GET requests.
  ///
  /// This method performs a GET request to the specified [url] with optional
  /// query parameters, options, and a cancel token.
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      // Rethrow Dio-specific exceptions for detailed error handling.
      rethrow;
    }
  }

  /// Handles POST requests.
  ///
  /// This method performs a POST request with the specified [url] and [data].
  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      // Rethrow generic exceptions.
      rethrow;
    }
  }

  /// Handles PUT requests.
  ///
  /// This method performs a PUT request with the specified [url] and [data].
  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      // Rethrow generic exceptions.
      rethrow;
    }
  }

  /// Handles DELETE requests.
  ///
  /// This method performs a DELETE request to the specified [url] with optional [data].
  Future<dynamic> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      // Rethrow generic exceptions.
      rethrow;
    }
  }
}
