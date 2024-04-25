import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kunuzclient/data/apis/news_api.dart';
import 'package:kunuzclient/domain/models/news_model.dart';

part 'news_state.dart';
part 'news_cubit.freezed.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(const NewsState.initial());

  //
  final NewsApis _newsApi = NewsApis();

  Future<void> getNews() async {
    emit(const NewsState.loading());
    final response = await _newsApi.getAllNews();

    response.fold((l) => emit(NewsState.error(l)),
        (data) => emit(NewsState.success(data)));
  }
}
