import 'package:BodyPower/features/news_page/data/models/news_page_models.dart';
import 'package:get/get.dart';

import '../repository/news_repository.dart';

class NewsPageController extends GetxController {
  static NewsPageController get instance => Get.find();
  final _newsRepo = Get.put(NewsRepository());

  Future<List<NewsModel>> getAllNews() async => await _newsRepo.allNews();
}
