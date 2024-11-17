// ignore_for_file: unused_local_variable

import 'package:ecommerce_test/features/Auth/controllers/login_number_controller.dart';
import 'package:ecommerce_test/features/Auth/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final signinController _loginController=Get.put(signinController());
  final OtpController _otpcontroler=Get.put(OtpController());

    String otps="";
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(image: AssetImage("Assets/logo/opt_image.jpg")),
          const Text("OTP Verfifcation"),
          Text("we have to send an unique OTP number to your mobile +91- ${_loginController.number_controller.text}"),
          OtpTextField(
            numberOfFields: 4,
            showFieldAsBox: true,
            borderColor: Colors.black,
            onCodeChanged: (String code){
              otps+=code;
            },
           onSubmit: (String code){
            _otpcontroler.checkOTP(code);
           },
          )
        ],   
        ),
      ),
    );
  }
}