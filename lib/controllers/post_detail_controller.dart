import 'package:get/get.dart';
import '../Models/post_model.dart';


class PostDetailController extends GetxController {
  late PostModel post;

  @override
  void onInit() {
    post = Get.arguments as PostModel;
    super.onInit();
  }
}
