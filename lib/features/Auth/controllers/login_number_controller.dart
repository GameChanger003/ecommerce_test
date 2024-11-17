// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
import 'dart:convert';
import 'package:ecommerce_test/features/Auth/controllers/device_info_controller.dart';
import 'package:ecommerce_test/features/Auth/view/otp_screen.dart';
import 'package:ecommerce_test/features/Auth/view/signup_page.dart';
import 'package:ecommerce_test/features/Store/View/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

  class signinController extends GetxController{
    TextEditingController number_controller = new TextEditingController();

    RxString email="".obs;
    RxString number="".obs;
    RxBool isPhone=true.obs;

    void changePhone(){
      isPhone.value=!isPhone.value;
    }

      void optsending()async{

        var api="http://devapiv4.dealsdray.com/api/v2/user/otp";

        Map<String,String> headers={
          'Content-Type': 'application/json',
        };

        Map<String,String> body={
          'deviceId': await androidDevieId(),
          'mobileNumber': number.value as String
        };
        try {
          final response=await http.post(
          Uri.parse(api),
          headers: headers,
          body: json.encode(body)
          );
          if (response.statusCode == 200) {
            print(response.body);
            Get.snackbar("Success", "OTP sent successfully");
            Get.to(const OtpScreen());
          } else {
            print("Error: ${response.body}");
            Get.snackbar("Error", "Failed to send OTP");
            Get.to(const SignupPage());
          }
        } catch (e) {
          print(e);
        }
      }

  }
