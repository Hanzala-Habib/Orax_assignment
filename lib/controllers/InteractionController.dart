import 'package:get/get.dart';

class InteractionController extends GetxController {
  RxInt favoriteCount = 0.obs;
  RxInt commentCount = 0.obs;
  RxInt shareCount = 0.obs;

  void incrementFavorite() => favoriteCount++;
  void incrementComment() => commentCount++;
  void incrementShare() => shareCount++;
}
