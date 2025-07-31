import 'package:get/get.dart';

class Comment {
  final String name;
  final String comment;
  final String date;
  late final RxInt likes;
  late final RxInt dislikes;

  Comment({
    required this.name,
    required this.comment,
    required this.date,
    int likes = 0,
    int dislikes = 0,
  })  : likes = likes.obs,
        dislikes = dislikes.obs;
}

class CommentController extends GetxController {
  var comments = <Comment>[
    Comment(name: "Ali", comment: "Nice work!", date: "Nov 29"),
    Comment(name: "Zara", comment: "Looks cool!", date: "Nov 28"),
  ].obs;

  void like(Comment c) => c.likes++;
  void dislike(Comment c) => c.dislikes++;
}
