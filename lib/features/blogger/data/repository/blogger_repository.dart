import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/blogger_model.dart';

class BloggerRepository extends GetxController {
  static BloggerRepository get instance => Get.find();
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

  Future<BloggerModel> getUserDetails(String id) async {
    final snapshot =
        await _db.collection("Bloggers").where("id", isEqualTo: id).get();
    final userData =
        snapshot.docs.map((e) => BloggerModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<BloggerModel>> allUser() async {
    final snapshot = await _db.collection("Bloggers").get();
    final bloggerData =
        snapshot.docs.map((e) => BloggerModel.fromSnapshot(e)).toList();
    return bloggerData;
  }

  // Future<void> updateUserRecord(BloggerModel blogger) async {
  //   await _db.collection("Bloggers").doc(blogger.id).update(blogger.toJson());
  // }
}
