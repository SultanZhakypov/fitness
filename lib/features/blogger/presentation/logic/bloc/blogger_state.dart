part of 'blogger_bloc.dart';

abstract class BloggerState {}

class BloggerInitial extends BloggerState {}

class LoadingState extends BloggerState {}

class FetchedBloggersState extends BloggerState {
  final List<BloggerModel> bloggers;

  FetchedBloggersState(this.bloggers);
}

class FetchedBloggerDetailState extends BloggerState {
  final ExerciseGroupCard exerciseGroupCard;

  FetchedBloggerDetailState(this.exerciseGroupCard);
}

class ErrorState extends BloggerState {
  final String error;

  ErrorState(this.error);
}
