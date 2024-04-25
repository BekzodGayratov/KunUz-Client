import 'package:dio/dio.dart';

class NetworkExceptionHandler {
  static String fromDioException(DioException exception) {
    if (exception.error.toString().contains("SocketException")) {
      return "No internet, please check your connection";
    } else {
      return exception.error.toString();
    }
  }
}
