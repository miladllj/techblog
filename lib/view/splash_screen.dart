import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/main_screen.dart';
import 'package:techblog/component/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                const MainScreen())); // pushReplacement() Replaces the forwarding page which is MainScreen in this code with splashScreen and removes it from the stack[0]
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColors.scaffoldBg,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: Image.asset(Assets.images.splash.path).image,
              height: 100,
            ),
            const SizedBox(
              height: 15,
            ),
            const SpinKitFadingCube(
              color: SolidColors.primaryColor,
              size: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
