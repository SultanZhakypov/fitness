part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class FetchedNewsState extends NewsState {
  final List<NewsModel> newsList;

  const FetchedNewsState(this.newsList);
}

class NewsLoadingState extends NewsState {}
class ErrorState extends  NewsState{
  final String error;

  ErrorState(this.error);
}

class FetchedNewsDetailsState extends NewsState {
  final NewsModel newsModel;

  const FetchedNewsDetailsState(this.newsModel);
}