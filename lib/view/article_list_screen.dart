import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/list_article_controller.dart';
// import 'package:techblog/view/single_article_screen.dart.dart';
import '../component/my_component.dart';
import '../controller/single_article_controller.dart';

class ArticleListScreen extends StatelessWidget {
  final String title;
  ArticleListScreen({required this.title, Key? key}) : super(key: key);
  final ListArticleController articleController =
      Get.put(ListArticleController());
  final SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(title),
        body: SizedBox(
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: articleController.articleList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    singleArticleController.getArticleInfo(
                        articleController.articleList[index].id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2.8,
                          height: Get.height / 6.5,
                          child: CachedNetworkImage(
                            imageUrl:
                                articleController.articleList[index].image!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              );
                            },
                            placeholder: (context, url) {
                              return const Loading();
                            },
                            errorWidget: (context, url, error) {
                              return const Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width / 2,
                              child: Text(
                                articleController.articleList[index].title!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  articleController.articleList[index].author!,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  '${articleController.articleList[index].view!} بازدید',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
