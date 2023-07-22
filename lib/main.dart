import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/binding.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/my_http_overrides.dart';
import 'package:techblog/view/main_screen/main_screen.dart';
import 'package:techblog/view/single_article_screen.dart.dart';
import 'package:techblog/view/splash_screen.dart';
// import 'package:techblog/view/register/register_intro.dart';
// import 'package:techblog/view/article_list_screen.dart';
// import 'package:techblog/view/single_article_screen.dart.dart';
// import 'package:techblog/view/main_screen/main_screen.dart';
// import 'package:techblog/view/my_categories.dart';
// import 'package:techblog/view/register_intro.dart';

// import 'view/splash_screen.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  // StatusBar and NavigationBar Colors and Icon Brightness settings
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: SolidColors.statusBarColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: SolidColors.systemNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark),
  );

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa'),
      theme: lightTheme,
      getPages: [
        GetPage(name: routeMainScreen, page: () => MainScreen(), binding: RegisterBindig()),
        GetPage(name: routeSingleArticle, page: () => SingleArticle(), binding: ArticleBinding())
      ],
      home: const SplashScreen(),
    ));
  }
}

ThemeData lightTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return const TextStyle(
                fontSize: 20, fontFamily: 'dana', fontWeight: FontWeight.w700);
          }
          return const TextStyle(
              fontSize: 15, fontFamily: 'dana', fontWeight: FontWeight.w700);
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.focused)) {
            return SolidColors.primaryColor;
          }
          return SolidColors.primaryColor;
        },
      ),
    ),
  ),
  fontFamily: 'dana',
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: SolidColors.posterTitle),
      displayMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.white),
      displaySmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: SolidColors.seeMore),
      bodyLarge: TextStyle(
        fontFamily: 'dana',
        fontSize: 13,
        fontWeight: FontWeight.w300,
      ),
      bodyMedium: TextStyle(
        color: SolidColors.primaryColor,
        fontFamily: 'dana',
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontFamily: 'dana',
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: SolidColors.welcomeText),
      titleMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: SolidColors.posterSubtitle),
      titleSmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black),
      headlineLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Colors.black),
      headlineMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: SolidColors.hintText),
      headlineSmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: SolidColors.primaryColor),
      labelMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: SolidColors.primaryColor)),
);


String routeMainScreen = '/MainScreen';
String routeSingleArticle = '/SingleArticle';