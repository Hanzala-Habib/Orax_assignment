import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/commentController.dart';

class DropdownComments extends StatefulWidget {
  @override
  State<DropdownComments> createState() => _DropdownCommentsWidgetState();
}

class _DropdownCommentsWidgetState extends State<DropdownComments> {
  bool showComments = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CommentController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () {
            setState(() {
              showComments = !showComments;
            });
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.grey.withValues(alpha: 0.1)),
          ),


          label: Text("Most Recent",style: TextStyle(color: Colors.black),),
          icon: Icon(showComments ? Icons.arrow_drop_up : Icons.arrow_drop_down,color: Colors.black,),
        ),
        if (showComments)
          Obx(() => ListView.builder(
            itemCount: controller.comments.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final comment = controller.comments[index];
              return ListTile(
                leading: CircleAvatar(child: Text(comment.name[0])),
                title: Row(
                  children: [
                    Text(comment.name,style: TextStyle(fontWeight: FontWeight.bold),),
                   SizedBox(width: 4,),
                    Text(comment.date, style: TextStyle(fontSize: 12)),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 4),
                    Text(comment.comment),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_up),
                          onPressed: () => controller.like(comment),
                        ),
                        Obx(() => Text("${comment.likes}")),
                        IconButton(
                          icon: Icon(Icons.thumb_down),
                          onPressed: () => controller.dislike(comment),
                        ),
                        Obx(() => Text("${comment.dislikes}")),
                      ],
                    ),
                  ],
                ),
              );
            },
          ))
      ],
    );
  }
}
