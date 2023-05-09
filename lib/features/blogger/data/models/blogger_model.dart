import 'package:cloud_firestore/cloud_firestore.dart';

class BloggerModel {
  final String? id;
  final String bloggerCardImage;
  final String bloggerCardName;
  final String bloggerCourseName;

  BloggerModel({
    this.id,
    required this.bloggerCardImage,
    required this.bloggerCardName,
    required this.bloggerCourseName,
  });
  toJson() {
    return {
      "BloggerCardImage": bloggerCardImage,
      "BloggerCardName": bloggerCardName,
      "BloggerCourseName": bloggerCourseName,
    };
  }

  factory BloggerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return BloggerModel(
      id: document.id,
      bloggerCardImage: data["BloggerCardImage"],
      bloggerCardName: data["BloggerCardName"],
      bloggerCourseName: data["BloggerCourseName"],
    );
  }
}
