import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orax_assignment/constants/commentFeild.dart';
import 'package:orax_assignment/constants/dropdownButton.dart';
import 'package:orax_assignment/controllers/commentController.dart';
import '../Models/post_model.dart';
import '../controllers/InteractionController.dart';
import '../controllers/post_detail_controller.dart';

class PostDetailView extends StatelessWidget {
  final controller = Get.put(PostDetailController());
  final InteractionController InteractionCounter = Get.put(InteractionController());
  final PostModel post = Get.arguments;
  final CommentController comment=Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Text("Post")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.post.title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text(controller.post.body),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: InteractionCounter.incrementFavorite,
                    child: Obx(() => Row(
                      children: [
                        Icon(Icons.favorite_border_outlined),
                        SizedBox(width: 4),
                        Text(InteractionCounter.favoriteCount.toString()),
                      ],
                    )),
                  ),
                  GestureDetector(
                    onTap: InteractionCounter.incrementComment,
                    child: Obx(() => Row(
                      children: [
                        Icon(Icons.comment),
                        SizedBox(width: 4),
                        Text(InteractionCounter.commentCount.toString()),
                      ],
                    )),
                  ),
                  GestureDetector(
                    onTap: InteractionCounter.incrementShare,
                    child: Obx(() => Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(width: 4),
                        Text(InteractionCounter.shareCount.toString()),
                      ],
                    )),
                  ),
                ],
              ),
              SizedBox(height: 8,),
              DropdownComments(),


          
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CommentFeild(),

    );
  }
}
