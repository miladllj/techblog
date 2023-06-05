import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/my_strings.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var faseleAzRast = size.width / 12;

    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColors.SCAFFOLDBG,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.menu_rounded),
                  Image(
                    image: Image.asset(Assets.images.splash.path).image,
                    height: size.height / 13.6,
                  ),
                  const Icon(Icons.search_rounded)
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Stack(
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
                          image: Image.asset(homePagePosterMap["imageAsset"])
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
                          colors: GradientColors.HOME_POSTER_COVER_GRADIENT,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ),
              const SizedBox(
                height: 32,
              ),

              // Tag List
              SizedBox(
                height: 60,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 5, index == 0 ? faseleAzRast : 15, 0),
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                          gradient: LinearGradient(
                              colors: GradientColors.TAGS,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Row(
                            children: [
                              ImageIcon(
                                AssetImage(Assets.icons.hashtag.path),
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                tagList[index].title,
                                style: textTheme.displayMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 32,
              ),

              // See More
              Padding(
                padding: EdgeInsets.only(right: faseleAzRast, bottom: 8),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(Assets.icons.pen.path),
                      color: SolidColors.SEE_MORE,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      MyStrings.VIEW_HOTTEST_BLOGS,
                      style: textTheme.displaySmall,
                    )
                  ],
                ),
              ),
              // Blog List List
              SizedBox(
                height: size.height / 3.5,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: blogList.length,
                  itemBuilder: ((context, index) {
                    // Blog Item
                    return Padding(
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
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              blogList[index].imageUrl),
                                          fit: BoxFit.cover),
                                    ),
                                    foregroundDecoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      gradient: LinearGradient(
                                          colors: GradientColors.BLOG_POST,
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
                              blogList[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
