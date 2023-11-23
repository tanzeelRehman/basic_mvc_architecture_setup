import 'package:basic_mvc_architecture_setup/core/error/exceptions.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  // final Dio dio;

  // AppInterceptors(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(err.requestOptions);

      case DioExceptionType.badCertificate:
        throw BadRequestException(err.requestOptions);

      case DioExceptionType.connectionError:
        throw InternalServerErrorException(err.requestOptions);
    }

    return handler.next(err);
  }
}
