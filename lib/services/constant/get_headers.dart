/// A utility class for common HTTP headers used in API calls.
///
/// This class centralizes header configurations, ensuring consistency
/// across different API services and requests.
class QSHeaders {
  /// Returns a map of headers for a basic JSON request.
  ///
  /// This is suitable for requests that send and receive JSON data.
  static Map<String, String> get basicJson {
    return {
      'Content-Type': 'application/json',
    };
  }

  /// Returns a map of headers for a multipart/form-data request.
  ///
  /// This is typically used for file uploads. The `Accept` header
  /// indicates that the client expects a JSON response.
  static Map<String, String> get basicMultipart {
    return {
      'Accept': 'application/json',
    };
  }
}
