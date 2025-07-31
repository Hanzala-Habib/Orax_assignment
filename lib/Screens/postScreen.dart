import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orax_assignment/constants/postCard.dart';
import '../Models/post_model.dart';
import '../controllers/post_list_controller.dart';

class PostListView extends StatelessWidget {
  final controller = Get.put(PostListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
          title: Text("Threads",style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: const Icon(Icons.add,size: 28,weight:600,),
            onPressed: () {
              // Handle search action
            },
          ),
        ],

      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final PostModel post = controller.posts[index];
            return ThreadCardTile(avatarUrl: "assets/man.png", post: post,  name: "${post.id}.Hanzala" , snippet:"${post.body}", dayAgo: "3d");
          },
        );
      }),
    );
  }
}
