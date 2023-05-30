import 'package:BodyPower/features/blogger/data/repository/blogger_repository_impl.dart';

import '../../data/models/blogger_model.dart';

class BloggerUseCase {
  BloggerRepositoryImpl bloggerRepositoryImpl = BloggerRepositoryImpl();
  Future<List<BloggerModel>> getAllBloggers() async =>
      await bloggerRepositoryImpl.getAllBloggers();

  Future<ExerciseGroupCard> getDetails(String id) async =>
      await bloggerRepositoryImpl.getExerciseCard(id);
}
