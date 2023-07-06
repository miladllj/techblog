import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/component/my_strings.dart';

import '../../component/my_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60,),
          Image.asset(
            Assets.images.avatar.path,
            height: size.height / 7.1,
            width: size.height / 3.7,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(Assets.icons.pen.path),
                color: SolidColors.seeMore,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                MyStrings.imageProfileEdit,
                style: textTheme.displaySmall,
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'فاطمه امیری',
            style: textTheme.bodyMedium,
          ),
          Text(
            'fatemeamiri@gmail.com',
            style: textTheme.bodySmall,
          ),
          const SizedBox(
            height: 30,
          ),
          TecDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: SolidColors.primaryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.myFavoriteBlogs,
                  style: textTheme.bodySmall,
                ),
              ),
            ),
          ),
          TecDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: SolidColors.primaryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.myFavoritePodcasts,
                  style: textTheme.bodySmall,
                ),
              ),
            ),
          ),
          TecDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: SolidColors.primaryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.logout,
                  style: textTheme.bodySmall,
                ),
              ),
            ),
          ),
          const SizedBox(height: 60,)
        ],
      ),
    );
  }
}
