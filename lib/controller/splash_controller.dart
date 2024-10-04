import 'package:e_book_2023/pages/homePage/home_page.dart';
import 'package:e_book_2023/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    splashController();
  }

  void splashController() {
    Future.delayed(Duration(seconds: 5), () {
      if (auth.currentUser != null) {
        Get.offAll(() => HomePage());
      } else {
        Get.offAll(() => WelcomePage());
      }
    });
  }
}
