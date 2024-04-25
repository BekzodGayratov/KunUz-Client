part of 'news_cubit.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.error(String? error) = _Error;
  const factory NewsState.success(NewsModel news) = _Success;
}
