import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orax_assignment/constants/postCard.dart';
import '../Models/post_model.dart';
import '../controllers/post_list_controller.dart';

class PostListView extends StatelessWidget {
  final controller = Get.put(PostListController());
  List<String> names = [
    'Alice', 'Bob', 'Charlie', 'David', 'Emma', 'Frank', 'Grace', 'Henry', 'Isla', 'Jack',
    'Karen', 'Liam', 'Mia', 'Noah', 'Olivia', 'Paul', 'Quinn', 'Rachel', 'Steve', 'Tina',
    'Uma', 'Victor', 'Wendy', 'Xavier', 'Yara', 'Zane', 'Aiden', 'Bella', 'Caleb', 'Daisy',
    'Ethan', 'Fiona', 'George', 'Hannah', 'Ian', 'Jade', 'Kyle', 'Laura', 'Mason', 'Nina',
    'Oscar', 'Penny', 'Quincy', 'Riley', 'Sam', 'Tara', 'Umar', 'Vera', 'Will', 'Xena',
    'Yusuf', 'Zara', 'Amber', 'Brandon', 'Carmen', 'Derek', 'Elsa', 'Felix', 'Gina', 'Harvey',
    'Ivy', 'Jake', 'Kylie', 'Leo', 'Megan', 'Nathan', 'Opal', 'Preston', 'Queen', 'Ron',
    'Sophie', 'Tom', 'Ursula', 'Vincent', 'Whitney', 'Ximena', 'Yasmine', 'Zack', 'Annie',
    'Bobby', 'Cleo', 'Dennis', 'Evelyn', 'Freddy', 'Gloria', 'Howard', 'Ingrid', 'Jonas',
    'Kristen', 'Louis', 'Molly', 'Neil', 'Octavia', 'Peter', 'Rosa', 'Shane', 'Tracy', 'Wade'
  ];

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
            return ThreadCardTile(avatarUrl: "assets/man.png", post: post,  name: names[index] , snippet:"${post.body}", dayAgo: "3d");
          },
        );
      }),
    );
  }
}
