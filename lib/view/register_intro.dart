import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/view/my_categories.dart';
import 'package:validators/validators.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/component/my_strings.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColors.scaffoldBg,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.techbot.path,
                height: size.height / 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.welcome, style: textTheme.titleLarge),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SizedBox(
                  height: size.height / 15.5,
                  width: size.width / 2.5,
                  child: ElevatedButton(
                    onPressed: () {
                      _showeEmailBottomSheet(context, size, textTheme);
                    },
                    child: const Text('بزن بریم'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> _showeEmailBottomSheet(
    BuildContext context, Size size, TextTheme textTheme) {
  //RegExp isEmail = RegExp('^[a-z-0-9]+@');
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: ((context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: size.height / 2.5,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.enterEmail,
                  style: textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 24, 50, 35),
                  child: TextField(
                    onChanged: (value) {
                      print(value + ' is Email = ' + isEmail(value).toString());
                    },
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'techblog@gmail.com',
                      hintStyle: textTheme.headlineMedium,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: SolidColors.divider,
                          width: 2, // Set your desired border width here
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 15.5,
                  width: size.width / 2.5,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _activateCodeBottomSheet(context, size, textTheme);
                    },
                    child: const Text('ادامه'),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }),
  );
}

Future<dynamic> _activateCodeBottomSheet(
    BuildContext context, Size size, TextTheme textTheme) {
  //RegExp isEmail = RegExp('^[a-z-0-9]+@');
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: ((context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: size.height / 2.5,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.activateCode,
                  style: textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 24, 50, 35),
                  child: TextField(
                    onChanged: (value) {},
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '******',
                      hintStyle: textTheme.headlineMedium,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: SolidColors.divider,
                          width: 2, // Set your desired border width here
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 15.5,
                  width: size.width / 2.5,
                  child: ElevatedButton(
                    onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyCategories(),));},
                    child: const Text('ادامه'),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }),
  );
}
