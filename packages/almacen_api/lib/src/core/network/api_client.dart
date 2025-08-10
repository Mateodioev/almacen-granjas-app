import 'package:almacen_api/src/core/network/api_interceptor.dart';
import 'package:dio/dio.dart';

/// HTTP client for making API requests to the Granjas Orihuela API.
class ApiClient {
  /// Creates a new instance of [ApiClient].
  ///
  /// The [apiKey] can be null when login, but its required for other requests
  /// like see inventory.
  ApiClient({
    required String apiKey,
  }) : dio = Dio(
         BaseOptions(
           baseUrl: 'https://granjasorihuela.com/api',
           headers: {
             'Authorization': 'Bearer $apiKey',
             'Content-Type': 'application/json',
           },
         ),
       ) {
    dio.interceptors.add(ApiInterceptor());
  }

  /// The Dio instance user for making API requests.
  final Dio dio;
}
