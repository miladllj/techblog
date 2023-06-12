import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import '../component/my_colors.dart';
import '../component/my_component.dart';
import '../component/my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.faseleAzRast,
  });

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
            HomePagePoster(size: size, textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),
            HomePageTagList(faseleAzRast: faseleAzRast, textTheme: textTheme),
            
            const SizedBox(
              height: 32,
            ),

            SeeMoreBlog(faseleAzRast: faseleAzRast, textTheme: textTheme),

            HomePageBlogList(size: size, faseleAzRast: faseleAzRast, textTheme: textTheme),
            
            const SizedBox(
              height: 32,
            ),

            SeeMorePodcast(faseleAzRast: faseleAzRast, textTheme: textTheme),

            HomePagePodcastList(size: size, faseleAzRast: faseleAzRast, textTheme: textTheme),
            
            SizedBox(
              height: size.height / 12,
            )
          ],
        ),
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    super.key,
    required this.size,
    required this.faseleAzRast,
    required this.textTheme,
  });

  final Size size;
  final double faseleAzRast;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: podcastList.length,
        itemBuilder: ((context, index) {
          // Podcast Item
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? faseleAzRast : 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: size.height / 5.8,
                    width: size.width / 2.9,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(16)),
                        image: DecorationImage(
                            image: NetworkImage(
                                podcastList[index].imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Text(
                  podcastList[index].title,
                  style: textTheme.titleSmall,
                ),
              ],
            ),
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

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.size,
    required this.faseleAzRast,
    required this.textTheme,
  });

  final Size size;
  final double faseleAzRast;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: blogList.length,
        itemBuilder: ((context, index) {
          // Blog Item
          return Padding(
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(
                                    Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    blogList[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration:
                              const BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(16)),
                            gradient: LinearGradient(
                                colors:
                                    GradientColors.blogPost,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                blogList[index].writer,
                                style: textTheme.titleMedium,
                              ),
                              Row(
                                children: [
                                  Text(
                                    blogList[index].views,
                                    style:
                                        textTheme.titleMedium,
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
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
          );
        }),
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

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.faseleAzRast,
    required this.textTheme,
  });

  final double faseleAzRast;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                0, 5, index == 0 ? faseleAzRast : 15, 0),
            child: MainTags(textTheme: textTheme, index: index),
          );
        }),
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image or Poster Container - Stack[0]
        Container(
          width: size.width / 1.19,
          height: size.height / 4.20,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            image: DecorationImage(
                image:
                    Image.asset(homePagePosterMap["imageAsset"])
                        .image,
                fit: BoxFit.cover),
          ),
          // Poster Shadow Settings
          foregroundDecoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            gradient: LinearGradient(
                colors:
                    GradientColors.homePosterCoverGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        // Texts on Poster - Stack[1]
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        " - " +
                        homePagePosterMap["date"],
                    style: textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["view"],
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
              const SizedBox(
                height: 8,
              ),
              Text(
                'دوازده قدم برنامه نویسی یک دوره ی...',
                style: textTheme.displayLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}