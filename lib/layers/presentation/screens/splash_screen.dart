import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irdfoundationtask/layers/presentation/getx_manager/chapter_screen_controller.dart';
import 'package:irdfoundationtask/layers/presentation/getx_manager/hadith_screen_controller.dart';
import 'package:irdfoundationtask/layers/presentation/screens/home_screens.dart';

import '../getx_manager/home_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1))
        .then((value) => {
        Get.find<HomeController>().getBookList(),
        Get.find<ChapterScreenController>().getChapterList(),
        Get.find<HadithScreenController>().getSectionList(),
        Get.find<HadithScreenController>().getHadithList(),
          Get.offAll(const HomeScreen())
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splash_screen.jpg'),
                  fit: BoxFit.fill
            )
          ),
        ),
      ),
    );
  }
}
