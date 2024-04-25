import 'package:dio/dio.dart';

class DIOCONFIG {
  static Dio createRequest() {
    Dio dio = Dio(BaseOptions(
      validateStatus: (int? statusCode) {
        if (statusCode != null) {
          if (statusCode >= 100 && statusCode <= 599) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      },
      receiveDataWhenStatusError: true,
    ));

    // TIME OUT CONFIGURATION
    dio.options.connectTimeout = const Duration(seconds: 55);
    dio.options.receiveTimeout = const Duration(seconds: 55);
    dio.options.sendTimeout = const Duration(seconds: 55);

    // // SSL VERIFICATION BYPASS
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
    //   client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };

    return dio;
  }
}
