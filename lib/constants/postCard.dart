import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../Models/post_model.dart';
import '../Screens/post_detail_view.dart';

class ThreadCardTile extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String snippet;
  final String dayAgo;
  final PostModel post;

  const ThreadCardTile({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.snippet,
    required this.dayAgo,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: 26,
        backgroundColor:  Colors.brown.withValues(alpha: 0.5),
        backgroundImage: AssetImage(avatarUrl), // Use NetworkImage for URLs
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(
            snippet,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            dayAgo,
            style: TextStyle(color: Colors.grey[500], fontSize: 13),
          ),
        ],
      ),
      onTap: () => Get.to(() => PostDetailView(), arguments: post),
    );
  }
}
