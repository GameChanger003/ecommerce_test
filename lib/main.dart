import 'package:ecommerce_test/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main () async{
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
   const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        body: SplashScreen(),
      ),
      );
  }
}
