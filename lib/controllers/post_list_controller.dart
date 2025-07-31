import 'package:get/get.dart';
import '../Models/post_model.dart';

import '../repository/post_repository.dart';

class PostListController extends GetxController {
  var isLoading = true.obs;
  var posts = <PostModel>[].obs;

  final PostRepository _repository = PostRepository();

  @override
  void onInit() {
    fetchAllPosts();
    super.onInit();
  }

  void fetchAllPosts() async {
    try {
      isLoading.value = true;
      final result = await _repository.fetchPosts();
      posts.value = result;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
