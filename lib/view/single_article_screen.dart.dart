import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/controller/list_article_controller.dart';
import 'package:techblog/controller/single_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/article_list_screen.dart';

import '../component/my_component.dart';

class SingleArticle extends StatelessWidget {
  final SingleArticleController singleArticleController =
      Get.find<SingleArticleController>();

  SingleArticle({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var faseleAzRast = size.width / 12;

    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => singleArticleController.articleInfoModel.value.title == null
              ? const Loading()
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.fast),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: singleArticleController
                                .articleInfoModel.value.image!,
                            imageBuilder: (context, imageProvider) =>
                                Image(image: imageProvider),
                            placeholder: (context, url) => const Loading(),
                            errorWidget: (context, url, error) => Image.asset(
                                Assets.images.singlePlaceHolder.path),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: GradientColors.singleArticleAppBar,
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.arrow_back,
                                      color: Colors.white, size: 24),
                                  Expanded(child: SizedBox()),
                                  Icon(Icons.bookmark_border_outlined,
                                      color: Colors.white, size: 24),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.share_rounded,
                                      color: Colors.white, size: 24),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          singleArticleController.articleInfoModel.value.title!,
                          style: textTheme.titleLarge,
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image(
                              image:
                                  Image.asset(Assets.images.avatar.path).image,
                              height: 50,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              singleArticleController
                                  .articleInfoModel.value.author!,
                              style: textTheme.headlineLarge,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              singleArticleController
                                  .articleInfoModel.value.createdAt!,
                              style: textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: Html(
                          data:
                              '<div>${singleArticleController.articleInfoModel.value.content!}</div>',
                          style: {
                            'div': Style(
                              color: SolidColors.welcomeText,
                              fontSize: FontSize(16),
                            ),
                          },
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: singleArticleController.tagList.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () async {
                                var tagId =
                                    singleArticleController.tagList[index].id!;
                                await Get.find<ListArticleController>()
                                    .getArticleListWithTagsId(tagId);
                                String tagName = singleArticleController
                                    .tagList[index].title!;
                                Get.to(() => ArticleListScreen(
                                      title: tagName,
                                    ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  height: 35,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(24)),
                                      color: Colors.grey),
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: Text(
                                        singleArticleController
                                            .tagList[index].title!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15),
                                      )),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 3.5,
                        child: Obx(
                          () => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            // TODO we have a bug here
                            itemCount:
                                singleArticleController.relatedList.length,
                            itemBuilder: ((context, index) {
                              // Blog Item
                              return GestureDetector(
                                onTap: () {
                                  singleArticleController.getArticleInfo(
                                      singleArticleController
                                          .relatedList[index].id);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: index == 0 ? faseleAzRast : 15),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: size.height / 5.3,
                                          width: size.width / 2.2,
                                          child: Stack(
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl:
                                                    singleArticleController
                                                        .relatedList[index]
                                                        .image!,
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                16)),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            singleArticleController
                                                                .relatedList[
                                                                    index]
                                                                .image!),
                                                        fit: BoxFit.cover),
                                                  ),
                                                  foregroundDecoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                16)),
                                                    gradient: LinearGradient(
                                                        colors: GradientColors
                                                            .blogPost,
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end: Alignment
                                                            .topCenter),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    const Loading(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(
                                                  Icons
                                                      .image_not_supported_outlined,
                                                  size: 50,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 8,
                                                left: 0,
                                                right: 0,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      singleArticleController
                                                          .relatedList[index]
                                                          .author!,
                                                      style:
                                                          textTheme.titleMedium,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          singleArticleController
                                                              .relatedList[
                                                                  index]
                                                              .view!,
                                                          style: textTheme
                                                              .titleMedium,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .remove_red_eye_sharp,
                                                          color: Colors.white,
                                                          size: 16,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width / 2.2,
                                        child: Text(
                                          singleArticleController
                                              .relatedList[index].title!,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: textTheme.headlineLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
