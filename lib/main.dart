import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irdfoundationtask/layers/presentation/getx_manager/home_controller.dart';
import 'package:irdfoundationtask/layers/presentation/screens/home_screens.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   // DatabaseManager.initDatabase(); // Initialize the database when the app starts

    return GetMaterialApp(
      initialBinding: GetxBinding(),
      debugShowMaterialGrid: false,
      title:"IRD Foundation",
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}


class GetxBinding extends Bindings {
  @override
  void dependencies() {
    Get.put( HomeController());
  }
}