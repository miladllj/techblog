import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/services/dio_services.dart';
import 'package:techblog/view/main_screen/main_screen.dart';
import 'package:techblog/view/register/register_intro.dart';

import '../component/storage_const.dart';
import '../gen/assets.gen.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activateCodeTextEditingController =
      TextEditingController();
  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };
    var response =
        await DioServices().postMethod(map, ApiConstant.postRegister);
    email = emailTextEditingController.text;
    userId = response.data['user_id'];

    debugPrint(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activateCodeTextEditingController.text,
      'command': 'verify'
    };
    debugPrint(map.toString());
    var response =
        await DioServices().postMethod(map, ApiConstant.postRegister);
    debugPrint(response.data.toString());
    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(token, response.data['token']);
        box.write(userId, response.data['user_id']);
        debugPrint("read::: ${box.read(token)}");
        debugPrint("read::: ${box.read(userId)}");
        Get.offAll(() => MainScreen());
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعالسازی اشتباه است');
        break;
      case 'expired':
        Get.snackbar('خطا', 'کد فعالسازی منقضی شده است');
        break;
    }
    // {response: verified, user_id: 179, token: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTc5LCJlbWFpbCI6Im1pbGFkLmxlbGhhakBnbWFpbC5jb20ifQ.PqLY1727cmOs-AY6mYvpQJfR7AlIQTaea2F9WUlb_eY}
  }

  toggleLogin() {
    if (GetStorage().read(token) == null) {
      Get.to(() => RegisterIntro());
    } else {
      writeBottomSheet();
    }
  }

  writeBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.images.techbot.path,
                  height: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'دانسته هات رو با بقیه به اشتراک بگذار',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              '''فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دانسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار...''',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint('Write Article');
                  },
                  child: Container(
                    height: 40,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.writearticle.path,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'مدیریت مقاله ها',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('post podcast');
                  },
                  child: Container(
                    height: 40,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.podcast.path,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'مدیریت پادکست ها',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
