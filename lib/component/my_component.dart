import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
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
    );
  }
}
