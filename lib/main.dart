import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/view/main_screen.dart';
import 'package:techblog/view/my_categories.dart';
import 'package:techblog/view/register_intro.dart';

import 'view/splash_screen.dart';

void main() {
  // StatusBar and NavigationBar Colors and Icon Brightness settings
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: SolidColors.statusBarColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: SolidColors.systemNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Farsi
      ],
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return const TextStyle(
                      fontSize: 20,
                      fontFamily: 'dana',
                      fontWeight: FontWeight.w700);
                }
                return const TextStyle(
                    fontSize: 15,
                    fontFamily: 'dana',
                    fontWeight: FontWeight.w700);
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
        ),
      ),
      home: MainScreen(),
    ));
  }
}
