/// Represents a successful API response with status code and optional data.
class ApiResponse<T> {
  /// Creates an API response with the given status code and optional data.
  const ApiResponse({
    required this.statusCode,
    this.data,
  });

  /// The HTTP status code of the response.
  final int statusCode;

  /// The optional data returned by the API.
  final T? data;

  /// Returns true if the request was accepted (200).
  bool get wasAccepted => statusCode == 200;

  /// Returns true if a resource was created (201).
  bool get wasCreated => statusCode == 201;

  /// Returns true if the request was accepted for background processing (202).
  bool get wasAcceptedForProcessing => statusCode == 202;

  /// Returns true if there's no content to return (204).
  bool get hasNoContent => statusCode == 204;

  /// Returns true if the response indicates success (2xx status codes).
  bool get isSuccess => statusCode >= 200 && statusCode < 300;
}
