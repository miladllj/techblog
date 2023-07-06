import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/single_article_controller.dart';
import 'package:techblog/view/article_list_screen.dart';

import '../../controller/home_screen_controller.dart';
import '../../gen/assets.gen.dart';
import '../../component/my_colors.dart';
import '../../component/my_component.dart';
import '../../component/my_strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.faseleAzRast,
  });

  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  final SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  final Size size;
  final TextTheme textTheme;
  final double faseleAzRast;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            poster(),
            const SizedBox(
              height: 32,
            ),
            tags(),
            const SizedBox(
              height: 32,
            ),
            //TODO در این قسمت گاهی تگ ها نمایش داده نمی شودند زمانیکه ویجت گستچر دیتکتور حذف میشود نمایش داده میشود و اگر به حالت قبلی بازگردانده شود باز هم نمایش داده میشود
            GestureDetector(
                onTap: () => Get.to(ArticleListScreen(title: 'مقالات جدید')),
                child: SeeMoreBlog(
                    faseleAzRast: faseleAzRast, textTheme: textTheme)),
            topVisited(),
            const SizedBox(
              height: 32,
            ),
            SeeMorePodcast(faseleAzRast: faseleAzRast, textTheme: textTheme),
            topPodcasts(),
            SizedBox(
              height: size.height / 12,
            )
          ],
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedList.length,
          itemBuilder: ((context, index) {
            // Blog Item
            return GestureDetector(
              onTap: () {
                singleArticleController.getArticleInfo(
                    homeScreenController.topVisitedList[index].id);
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? faseleAzRast : 15),
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
                              imageUrl: homeScreenController
                                  .topVisitedList[index].image!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  image: DecorationImage(
                                      image: NetworkImage(homeScreenController
                                          .topVisitedList[index].image!),
                                      fit: BoxFit.cover),
                                ),
                                foregroundDecoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  gradient: LinearGradient(
                                      colors: GradientColors.blogPost,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                ),
                              ),
                              placeholder: (context, url) => Loading(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),

                            // TODO میتونم الان کامنت پایینی رو حذف کنم

                            // Container(
                            //   decoration: BoxDecoration(
                            //     borderRadius:
                            //         const BorderRadius.all(Radius.circular(16)),
                            //     image: DecorationImage(
                            //         image: NetworkImage(homeScreenController
                            //             .topVisitedList[index].image!),
                            //         fit: BoxFit.cover),
                            //   ),
                            //   foregroundDecoration: const BoxDecoration(
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(16)),
                            //     gradient: LinearGradient(
                            //         colors: GradientColors.blogPost,
                            //         begin: Alignment.bottomCenter,
                            //         end: Alignment.topCenter),
                            //   ),
                            // ),
                            Positioned(
                              bottom: 8,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    homeScreenController
                                        .topVisitedList[index].author!,
                                    style: textTheme.titleMedium,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        homeScreenController
                                            .topVisitedList[index].view!,
                                        style: textTheme.titleMedium,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.remove_red_eye_sharp,
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
                        homeScreenController.topVisitedList[index].title!,
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
    );
  }

  Widget topPodcasts() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topPodcastsList.length,
          itemBuilder: ((context, index) {
            // Podcast Item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? faseleAzRast : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 5.8,
                      width: size.width / 2.9,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcastsList[index].poster!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        ),
                        placeholder: (context, url) => Loading(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),

                      // TODO همچنین این کامنت رو
                      // child: Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius:
                      //         const BorderRadius.all(Radius.circular(16)),
                      //     image: DecorationImage(
                      //         image: NetworkImage(homeScreenController
                      //             .topPodcastsList[index].poster!),
                      //         fit: BoxFit.cover),
                      //   ),
                      // ),
                    ),
                  ),
                  Text(
                    homeScreenController.topPodcastsList[index].title!,
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget poster() {
    return Obx(
      () => homeScreenController.loading.value == false
          ? Stack(
              children: [
                // Image or Poster Container - Stack[0]
                Container(
                  width: size.width / 1.19,
                  height: size.height / 4.20,
                  // Poster Shadow Settings
                  foregroundDecoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                        colors: GradientColors.homePosterCoverGradient,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: homeScreenController.poster.value.image!,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                    placeholder: (context, url) => Loading(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.image_not_supported_outlined,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                // Texts on Poster - Stack[1]
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Text(
                    homeScreenController.poster.value.title!,
                    style: textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          : const Loading(),
    );
  }

  Widget tags() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        // when itemCount: taglist.length it shows up but has bug
        itemCount: homeScreenController.tagsList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding:
                EdgeInsets.fromLTRB(0, 5, index == 0 ? faseleAzRast : 15, 0),
            child: MainTags(textTheme: textTheme, index: index),
          );
        }),
      ),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.faseleAzRast,
    required this.textTheme,
  });

  final double faseleAzRast;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: faseleAzRast, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.mic.path),
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHottestPodcasts,
            style: textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.faseleAzRast,
    required this.textTheme,
  });

  final double faseleAzRast;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: faseleAzRast, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.pen.path),
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHottestBlogs,
            style: textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}
