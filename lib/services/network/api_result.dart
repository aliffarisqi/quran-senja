/// A sealed class to represent the result of an API call.
///
/// This sealed class ensures that the API call result can only be one of two
/// possible states: success or error. This pattern is excellent for
/// type-safe handling of network responses.
sealed class ApiResult<T> {
  const ApiResult();
}

/// Represents a successful API call result.
///
/// This class holds the successful `data` and an optional `message`.
class ApiSuccess<T> extends ApiResult<T> {
  /// The data returned from the successful API call.
  final T data;

  /// An optional success message.
  final String? message;

  const ApiSuccess(this.data, {this.message});
}

/// Represents a failed API call result.
///
/// This class holds an error `message` and an optional error `code`.
class ApiError<T> extends ApiResult<T> {
  /// The error message explaining the failure.
  final String message;

  /// An optional error code (e.g., HTTP status code).
  final int? code;

  const ApiError(this.message, {this.code});
}
