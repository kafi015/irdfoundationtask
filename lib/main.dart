import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irdfoundationtask/layers/presentation/getx_manager/chapter_screen_controller.dart';
import 'package:irdfoundationtask/layers/presentation/getx_manager/hadith_screen_controller.dart';
import 'package:irdfoundationtask/layers/presentation/getx_manager/home_controller.dart';
import 'package:irdfoundationtask/layers/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetxBinding(),
      debugShowMaterialGrid: false,
      title: "IRD Foundation",
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class GetxBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ChapterScreenController());
    Get.put(HadithScreenController());
  }
}
