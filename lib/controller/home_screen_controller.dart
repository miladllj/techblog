import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_services.dart';

import '../models/article_model.dart';

class HomeScreenController extends GetxController {

  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastsList = RxList();

  RxBool loading = false.obs;
  
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioServices().getMethod(ApiConstant.getHomeItems);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
        // log(topVisitedList.toString());
      });

      response.data['top_podcasts'].forEach((element) {
        topPodcastsList.add(PodcastModel.fromJson(element));
        //topPodcastsList.map((element) => log(element.toString()));
      });

      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);
      // log('poster.value is = ${poster.value}');
      // log('response.data is = $poster');
      loading.value = false;
    }
  }
}
