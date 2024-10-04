import 'package:e_book_2023/config/messages.dart';
import 'package:e_book_2023/pages/homePage/home_page.dart';
import 'package:e_book_2023/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final auth = FirebaseAuth.instance;

  loginWithEmail() async {
    isLoading.value = true;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      //Create a new credential

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // log(credential.toString());

      await FirebaseAuth.instance.signInWithCredential(credential);
      successMessage("Login Success");
      Get.offAll(HomePage());
    } catch (ex) {
      print(ex);
      errorMessage("Error | Try Again");
    }

    isLoading.value = false;
  }

  void signOut() async {
    await auth.signOut();
    successMessage("Logout");
    Get.offAll(WelcomePage());
  }
}
