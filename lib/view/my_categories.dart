import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/data_models.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/my_component.dart';

import '../my_strings.dart';

class MyCategories extends StatefulWidget {
  const MyCategories({super.key});

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var faseleAzRast = size.width / 12;
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColors.scaffoldBg,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 36,
                ),
                SvgPicture.asset(Assets.images.techbot.path,
                    height: size.height / 5),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  MyStrings.successfullRegisteration,
                  style: textTheme.headlineSmall,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 25, 40, 25),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "نام و نام خانوادگی",
                        contentPadding: const EdgeInsets.only(top: 5),
                        hintStyle: textTheme.headlineMedium,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                Text(
                  MyStrings.chooseCategory,
                  style: textTheme.headlineSmall,
                ),
                // Tag List
                Padding(
                  padding: EdgeInsets.only(top: 25, right: faseleAzRast),
                  child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.22),
                      itemCount: tagList.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                bool alreadyExists = selectedTags.any(
                                    (tag) => tag.title == tagList[index].title);
                                if (alreadyExists) {
                                  var title = tagList[index].title;
                                  _showSnackBar(context,
                                      'دسته بندی $title قبلا اضافه شده است');
                                } else {
                                  selectedTags.add(HashTagModel(
                                      title: tagList[index].title));
                                }
                              });
                            },
                            child:
                                MainTags(textTheme: textTheme, index: index));
                      }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Image.asset(
                  Assets.images.arrow.path,
                  scale: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      //shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // gridDelegate:
                      //     const SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 1,
                      //         crossAxisSpacing: 5,
                      //         mainAxisSpacing: 5,
                      //         childAspectRatio: 0.2),
                      itemCount: selectedTags.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            15,
                            0,
                            index == 0 ? faseleAzRast : 0,
                            0,
                          ),
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(24),
                                ),
                                color: SolidColors.selectedTagsBG),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    selectedTags[index].title + '   ',
                                    style: const TextStyle(
                                        color: SolidColors.selectedTagsText,
                                        fontFamily: 'dana',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                  InkWell(
                                    onTap: (() {
                                      setState(() {
                                        selectedTags.removeAt(index);
                                      });
                                    }),
                                    child: const Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(
                    height: size.height / 15.5,
                    width: size.width / 2.5,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('ادامه')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      backgroundColor: Colors.green));
}
