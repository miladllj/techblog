import 'dart:developer';

import 'package:get/get.dart';
import 'package:techblog/models/article_info_model.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/tags_model.dart';

import '../component/api_constant.dart';
import '../services/dio_services.dart';
import '../view/single_article_screen.dart.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> relatedList = RxList();

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;
    loading.value = true;
    //TODO userId is hardcode
    var userId = '';

    var response = await DioServices().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
    }

    tagList.clear();
    response.data['tags'].forEach(
      (element) {
        tagList.add(TagsModel.fromJson(element));
      },
    );

    relatedList.clear();
    response.data['related'].forEach((element) {
      relatedList.add(ArticleModel.fromJson(element));
      for (var relatedItem in relatedList) {
        //log(relatedItem.toString());
      }
    });
    Get.to(() => SingleArticle());
  }
}
