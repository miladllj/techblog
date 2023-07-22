import 'package:get/get.dart';
import 'package:techblog/controller/list_article_controller.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/controller/single_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListArticleController());

    Get.lazyPut(() => SingleArticleController());
  }
}

class RegisterBindig implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
