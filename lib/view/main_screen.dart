import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/view/profile_screen.dart';

import '../my_component.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}
  final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var faseleAzRast = size.width / 12;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: faseleAzRast, left: faseleAzRast),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      Assets.images.splash.path,
                      scale: 2.2,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'پروفایل کاربری',
                    style: textTheme.bodySmall,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title: Text(
                    'درباره تک بلاگ',
                    style: textTheme.bodySmall,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title: Text(
                    'اشتراک گذاری تک بلاگ',
                    style: textTheme.bodySmall,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title: Text(
                    'تک بلاگ در گیت هاب',
                    style: textTheme.bodySmall,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: SolidColors.scaffoldBg,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu_rounded,
                  color: Colors.black,
                ),
              ),
              Image(
                image: Image.asset(Assets.images.splash.path).image,
                height: size.height / 13.6,
              ),
              const Icon(
                Icons.search_rounded,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: IndexedStack(
              index: selectedPageIndex,
              children: [
                HomeScreen(
                    size: size,
                    textTheme: textTheme,
                    faseleAzRast: faseleAzRast), // 0
                ProfileScreen(
                    size: size,
                    textTheme: textTheme,
                    faseleAzRast: faseleAzRast) // 1
              ],
            )),
            BottomNavigation(
                size: size,
                faseleAzRast: faseleAzRast,
                changeScreen: (int value) {
                  setState(() {
                    selectedPageIndex = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.faseleAzRast,
    required this.changeScreen,
  });

  final Size size;
  final double faseleAzRast;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Stack(
        children: [
          Container(
            height: size.height / 5.8,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: GradientColors.buttomNavigationBackground,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.only(
                  right: faseleAzRast * 2 - 10, left: faseleAzRast * 2 - 10),
              child: Container(
                height: size.height / 12,
                decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: GradientColors.buttomNavigation),
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Home Icon
                    IconButton(
                      onPressed: (() => changeScreen(0)),
                      icon: ImageIcon(
                        AssetImage(Assets.icons.home.path),
                        color: Colors.white,
                      ),
                    ),
                    // Write Icon
                    IconButton(
                      onPressed: (() {}),
                      icon: ImageIcon(
                        AssetImage(Assets.icons.write.path),
                        color: Colors.white,
                      ),
                    ),
                    // User Icon
                    IconButton(
                      onPressed: (() => changeScreen(1)),
                      icon: ImageIcon(
                        AssetImage(Assets.icons.user.path),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
