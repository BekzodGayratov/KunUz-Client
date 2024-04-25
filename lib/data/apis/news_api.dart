import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kunuzclient/config/dio_config.dart';
import 'package:kunuzclient/config/network_exception_handler.dart';
import 'package:kunuzclient/domain/constants/constants.dart';
import 'package:kunuzclient/domain/models/news_model.dart';

class NewsApis {
  // Get all news
  Future<Either<String, NewsModel>> getAllNews() async {
    try {
      Response response = await DIOCONFIG
          .createRequest()
          .get("${Constants.currentServer}/news");

      if (response.statusCode == 200) {
        return right(NewsModel.fromJson(response.data));
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return left(NetworkExceptionHandler.fromDioException(e));
    }
  }
}
