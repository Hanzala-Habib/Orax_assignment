import 'package:flutter/material.dart';

class CommentFeild extends StatelessWidget {
  const CommentFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar
        CircleAvatar(

          radius: 20,
          backgroundImage: AssetImage('assets/man.png'), // Use your own image or NetworkImage
        ),
        const SizedBox(width: 10),

        // Text Field
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Add a comment...',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
            maxLines: null, // Allows multi-line input
          ),
        ),

        const SizedBox(width: 8),

        // Send Icon (dummy)
        IconButton(
          onPressed: () {
            // Dummy action
          },
          icon: const Icon(Icons.image),
        ),
      ],
    );
  }
}
