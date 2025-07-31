import 'package:get/get.dart';

class Comment {
  final String name;
  final String avatarUrl;
  final String date;
  final String commentText;
  RxInt likes;
  RxInt dislikes;

  Comment({
    required this.name,
    required this.avatarUrl,
    required this.date,
    required this.commentText,
    RxInt? likes,
    RxInt? dislikes,
  })  : likes = likes ?? 0.obs,
        dislikes = dislikes ?? 0.obs;
}
