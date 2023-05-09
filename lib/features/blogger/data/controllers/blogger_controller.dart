import 'package:fitness/features/blogger/data/models/blogger_model.dart';
import 'package:get/get.dart';

import '../repository/blogger_repository.dart';

class BloggerController extends GetxController {
  static BloggerController get instance => Get.find();
  final _blogerRepo = Get.put(BloggerRepository());

  Future<List<BloggerModel>> getAllBloggers() async => await _blogerRepo.allUser();
}
