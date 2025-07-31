import '../Models/post_model.dart';
import '../services/api_service.dart';

class PostRepository {
  Future<List<PostModel>> fetchPosts() async {
    final data = await ApiService.getPosts();
    return data.map((item) => PostModel.fromJson(item)).toList();
  }
}
