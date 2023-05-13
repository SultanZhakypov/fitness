import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:BodyPower/features/news_page/data/models/news_page_models.dart';
import 'package:get/get.dart';

class NewsRepository extends GetxController {
  static NewsRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  // createUser(UserModel user) async {
  //   try {
  //     await _db
  //         .collection("User")
  //         .add(user.toJson())
  //         .whenComplete(() => Get.snackbar(
  //               "Succes",
  //               "You account has been created",
  //               snackPosition: SnackPosition.BOTTOM,
  //               backgroundColor: Colors.green.withOpacity(0.1),
  //               colorText: Colors.green,
  //             ));
  //   } catch (e) {
  //     Get.snackbar(
  //       "Error",
  //       "try ----again",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.redAccent.withOpacity(0.1),
  //       colorText: Colors.red,
  //     );
  //     print("ERROR ---------${e.toString()}");
  //   }
  //   ;
  // }

  Future<NewsModel> getNewsDetails(String id) async {
    final snapshot =
        await _db.collection("News").where("id", isEqualTo: id).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).single;
    return newsData;
  }

  Future<List<NewsModel>> allNews() async {
    final snapshot = await _db.collection("News").get();
    final newsData =
        snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    return newsData;
  }

  // Future<void> updateUserRecord(BloggerModel blogger) async {
  //   await _db.collection("Bloggers").doc(blogger.id).update(blogger.toJson());
  // }
}
