import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/list_article_controller.dart';
import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import '../view/article_list_screen.dart';
import 'my_colors.dart';

class TecDivider extends StatelessWidget {
  const TecDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.divider,
      indent: size.width / 6,
      thickness: 0.75,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  final index;

  @override
  Widget build(BuildContext context) {
    ListArticleController listArticleController =
        Get.put(ListArticleController());
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
        gradient: LinearGradient(
            colors: GradientColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: GestureDetector(
          onTap: () async {
            var tagId = Get.find<HomeScreenController>().tagsList[index].id!;
            await listArticleController.getArticleListWithTagsId(tagId);
            String tagName = Get.find<HomeScreenController>().tagsList[index].title!;
            Get.to(() => ArticleListScreen(
                  title: tagName,
                ));
          },
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
                Get.find<HomeScreenController>().tagsList[index].title!,
                style: textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}

myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  try {
    List<bool> results = await Future.wait([launchUrl(uri)])
        .timeout(const Duration(seconds: 30));
    bool launched = results[0];
    if (!launched) {
      log('Could not launch $url');
    }
  } catch (e) {
    log('Error launching $url: ${e.toString()}');
  }
}

PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(65),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                    fontFamily: 'dana',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: SolidColors.primaryColor),
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: SolidColors.primaryColor.withAlpha(100),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.keyboard_arrow_right_rounded),
          ),
        ),
      ),
    ),
  );
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitCircle(
      color: SolidColors.primaryColor,
      size: 32,
    );
  }
}
