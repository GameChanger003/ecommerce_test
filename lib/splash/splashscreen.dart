import 'dart:async';

import 'package:ecommerce_test/features/Auth/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to transition to the next screen after a few seconds
    Timer(Duration(seconds: 3), () {
      Get.offAll(const LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Container(
        width: MediaQuery.of(context).size.width, 
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.asset(
              'Assets/logo/bg.png',  
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Center(child: CircularProgressIndicator(),),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'Assets/logo/company_logo.png', // Replace with your logo asset path
                  width: 100, // Size of the logo at the bottom
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}