import 'dart:developer';

import 'package:BodyPower/features/blogger/data/models/blogger_model.dart';
import 'package:BodyPower/features/blogger/domain/use_case/blogger_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'blogger_event.dart';
part 'blogger_state.dart';

class BloggerBloc extends Bloc<BloggerEvent, BloggerState> {
  final BloggerUseCase bloggerUseCase;
  BloggerBloc({required this.bloggerUseCase}) : super(BloggerInitial()) {
    on<GetBloggersEvent>((event, emit) async {
      emit(BloggerLoadingState());
      try {
        List<BloggerModel> bloggers = await bloggerUseCase.getAllBloggers();
        emit(FetchedBloggersState(bloggers));
      } catch (e) {
        log(" BLOGGERS    ${e.toString()}");
      }

      // BloggerUseCase()
      //     .getAllBloggers()
      //     .then((bloggers) => emit(FetchedBloggersState(bloggers)))
      //     .onError((error, stackTrace) => emit(ErrorState(error.toString())));
    });
    on<GetBloggerDetailEvent>((event, emit) async {
      emit(BloggerLoadingState());

      bloggerUseCase
          .getDetails(event.id)
          .then((bloggerDetails) =>
              emit(FetchedBloggerDetailState(bloggerDetails)))
          .onError((error, stackTrace) => emit(ErrorState(error.toString())));
    });
  }
}
