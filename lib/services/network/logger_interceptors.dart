import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// A Dio Interceptor for logging HTTP requests, responses, and errors.
///
/// This interceptor uses the `logger` package to provide detailed and
/// formatted logs, which is very useful for debugging network issues.
class LoggerInterceptor extends Interceptor {
  // Configures the logger with a simple, readable format.
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // Hides the method call stack.
      colors: true, // Enables colorful logging.
      printEmojis: true, // Prints emojis for better visual distinction.
    ),
  );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Retrieves request information from the error.
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    // Logs the error details.
    logger.e('${options.method} request ==> $requestPath'); // Error log
    logger.d('Error type: ${err.error} \n'
        'Error message: ${err.message}'); // Debug log

    // Continues the error handling chain.
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Constructs the full request path.
    final requestPath = '${options.baseUrl}${options.path}';

    // Logs the request details.
    logger.i('${options.method} request ==> $requestPath'); // Info log

    // Continues with the request.
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Logs the response details.
    logger.d(
      'STATUSCODE: ${response.statusCode} \n'
      'STATUSMESSAGE: ${response.statusMessage} \n'
      'HEADERS: ${response.headers} \n'
      'Data: ${response.data}',
    ); // Debug log

    // Continues with the response.
    handler.next(response);
  }
}
