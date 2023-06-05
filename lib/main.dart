import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/my_colors.dart';

import './splash_screen.dart';

void main() {
  // StatusBar and NavigationBar Colors and Icon Brightness settings
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: SolidColors.STATUSBAR_COLOR,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: SolidColors.SYSTEM_NAVIGATIONBAR_COLOR,
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
        fontFamily: 'dana',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColors.POSTER_TITLE),
          displayMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white),
          displaySmall: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColors.SEE_MORE),
          titleMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColors.POSTER_SUBTITLE),
          bodyLarge: TextStyle(
              fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
          titleSmall: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.green),
        ),
      ),
      home: SplashScreen(),
    ));
  }
}
