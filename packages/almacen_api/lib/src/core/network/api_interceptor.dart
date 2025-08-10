import 'package:almacen_api/src/core/api_response.dart';
import 'package:almacen_api/src/core/network/api_exceptions.dart';
import 'package:dio/dio.dart';

/// An interceptor for handling internal API errors and converting them to
/// appropriate exceptions types based on HTTP status codes.
class ApiInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      final apiResponse = ApiResponse(
        statusCode: response.statusCode!,
        data: response.data,
      );
      response.data = apiResponse;
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode ?? 0;
    final responseData = err.response?.data;

    final message = responseData is Map
        // ignore: avoid_dynamic_calls Api call always returns a Map
        ? responseData['error']['message']?.toString() ?? err.message
        : err.message;

    switch (status) {
      case 400:
        handler.reject(BadRequestException(message));
      case 401:
        handler.reject(UnauthorizedException(message));
      case 403:
        handler.reject(ForbiddenException(message));
      case 404:
        handler.reject(NotFoundException(message));
      case 405:
        handler.reject(MethodNotAllowedException(message));
      case 408:
        handler.reject(RequestTimeoutException(message));
      case 422:
        handler.reject(UnprocessableEntityException(message));
      case 429:
        handler.reject(TooManyRequestsException(message));
      case 500:
      case 502:
      case 503:
      case 504:
        handler.reject(ServerErrorException(message));
      default:
        handler.reject(ApiException(status, message));
    }
  }
}
