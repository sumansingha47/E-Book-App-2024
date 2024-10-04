import 'package:e_book_2023/config/themes.dart';
import 'package:e_book_2023/firebase_options.dart';
import 'package:e_book_2023/pages/SplashPage/Splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Book 2023',
      theme: lightTheme,
      // home: WelcomePage(),
      home: SplashPage(),
    );
  }
}
