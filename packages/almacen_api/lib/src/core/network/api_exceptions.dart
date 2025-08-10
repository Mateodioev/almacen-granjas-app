import 'package:dio/dio.dart';

/// Exception thrown when a request returns a 400 Bad Request response.
class BadRequestException extends DioException {
  /// Creates a new [BadRequestException] with the specified error message.
  BadRequestException(String? message)
    : super(
        requestOptions: RequestOptions(),
        message: message,
      );
}

/// Exception thrown when a request returns a 401 Unauthorized response.
class UnauthorizedException extends DioException {
  /// Creates a new [UnauthorizedException] with the specified error message.
  UnauthorizedException(String? message)
    : super(
        requestOptions: RequestOptions(),
        message: message,
      );
}

/// Exception thrown when a request returns a 403 Forbidden response.
class ForbiddenException extends DioException {
  /// Creates a new [ForbiddenException] with the specified error message.
  ForbiddenException(String? message)
    : super(
        requestOptions: RequestOptions(),
        message: message,
      );
}

/// Exception thrown when a request returns a 404 Not Found response.
class NotFoundException extends DioException {
  /// Creates a new [NotFoundException] with the specified error message.
  NotFoundException(String? message)
    : super(
        requestOptions: RequestOptions(),
        message: message,
      );
}

/// Exception thrown when a request returns a 405 Method Not Allowed response.
class MethodNotAllowedException extends DioException {
  /// Creates a new [MethodNotAllowedException]
  ///  with the specified error message.
  MethodNotAllowedException(String? message)
    : super(
        requestOptions: RequestOptions(),
        message: message,
      );
}

/// Exception thrown when a request returns a 408 Request Timeout response.
class RequestTimeoutException extends DioException {
  /// Creates a new [RequestTimeoutException] with the specified error message.
  RequestTimeoutException(String? message)
    : super(
        requestOptions: RequestOptions(),
        message: message,
      );
}

/// Exception thrown when a request returns a 422 Unprocessable Entity response.
class UnprocessableEntityException extends DioException {
  /// Creates a new [UnprocessableEntityException]
  ///  with the specified error message.
  UnprocessableEntityException(String? message)
    : super(
        requestOptions: RequestOptions(),
        message: message,
      );
}

/// Exception thrown when a request returns a 429 Too Many Requests response.
class TooManyRequestsException extends DioException {
  /// Creates a new [TooManyRequestsException] with the specified error message.
  TooManyRequestsException(String? message)
    : super(
        requestOptions: RequestOptions(),
        message: message,
      );
}

/// Exception thrown when a request returns a 5xx Server Error response.
class ServerErrorException extends DioException {
  /// Creates a new [ServerErrorException] with the specified error message.
  ServerErrorException(String? message)
    : super(
        requestOptions: RequestOptions(),
        message: message,
      );
}

/// Generic API exception with a custom status code.
class ApiException extends DioException {
  /// Creates a new [ApiException]
  /// with the specified status code and error message.
  ApiException(this.statusCode, String? message)
    : super(
        requestOptions: RequestOptions(),
        message: message,
      );

  /// The HTTP status code associated with this exception.
  final int statusCode;
}
