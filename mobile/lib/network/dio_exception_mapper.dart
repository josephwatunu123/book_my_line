import 'package:dio/dio.dart';
import 'package:mobile/network/api_exception.dart';

ApiException mapDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return ApiException(
        type: ApiExceptionType.timeout,
        message: "The request timed out. Please try again.",
        cause: error,
      );
    case DioExceptionType.cancel:
      return ApiException(
        type: ApiExceptionType.requestCancelled,
        message: 'The request was cancelled.',
        cause: error,
      );
    case DioExceptionType.connectionError:
      return ApiException(
        type: ApiExceptionType.noConnection,
        message: 'Could not connect to the server.',
        cause: error,
      );

    case DioExceptionType.badResponse:
      return _mapBadResponse(error);

    case DioExceptionType.badCertificate:
      return ApiException(
        type: ApiExceptionType.unknown,
        message: 'A secure connection could not be established.',
        cause: error,
      );

    case DioExceptionType.unknown:
      return ApiException(
        type: ApiExceptionType.unknown,
        message: 'An unexpected network error occurred.',
        cause: error,
      );
  }
}

ApiException _mapBadResponse(DioException error) {
  final statusCode = error.response?.statusCode;
  final serverMessage = _extractServerMessage(error.response?.data);

  ApiExceptionType type;
  String fallbackMessage;

  switch (statusCode) {
    case 400:
      type = ApiExceptionType.badRequest;
      fallbackMessage = 'The request was invalid.';
      break;
    case 401:
      type = ApiExceptionType.unauthorized;
      fallbackMessage = 'Authentication is required.';
      break;
    case 403:
      type = ApiExceptionType.forbidden;
      fallbackMessage = 'You are not allowed to perform this action.';
      break;
    case 404:
      type = ApiExceptionType.notFound;
      fallbackMessage = 'The requested resource was not found.';
      break;
    case 409:
      type = ApiExceptionType.conflict;
      fallbackMessage = 'The request conflicts with the current state.';
      break;
    default:
      if (statusCode != null && statusCode >= 500) {
        type = ApiExceptionType.serverError;
        fallbackMessage = 'The server encountered an error.';
      } else if (statusCode != null && statusCode >= 400) {
        type = ApiExceptionType.badRequest;
        fallbackMessage = 'The request could not be completed.';
      } else {
        type = ApiExceptionType.invalidResponse;
        fallbackMessage = 'The server returned an invalid response.';
      }
  }

  return ApiException(
    type: type,
    message: serverMessage ?? fallbackMessage,
    statusCode: statusCode,
    cause: error,
  );
}

String? _extractServerMessage(dynamic data) {
  if (data is Map && data['message'] is String) {
    return data['message'] as String;
  }

  return null;
}
