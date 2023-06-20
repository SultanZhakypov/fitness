part of 'blogger_bloc.dart';

abstract class BloggerEvent {}

class BloggerLoadingEvent extends BloggerEvent {}

class GetBloggersEvent extends BloggerEvent {}

class GetBloggerDetailEvent extends BloggerEvent {
  final String id;

  GetBloggerDetailEvent(this.id);
}
