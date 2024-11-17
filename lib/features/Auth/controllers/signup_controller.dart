import 'dart:convert';

import 'package:ecommerce_test/features/Store/View/Navigation_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController{
  final TextEditingController mailController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();
  final TextEditingController referalController= TextEditingController();
  var uuid=Uuid().v1();

    RxBool isVisible=false.obs;

    void visibility(){
      isVisible.value=!isVisible.value;
    }
    
  void signup() async{
    if(mailController.text.isEmpty || passwordController.text.isEmpty){
      Get.snackbar("Error","Please fill out all fields",snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if(passwordController.text.length < 8){
      Get.snackbar("Error", "Password must be at least 8 characters long",snackPosition: SnackPosition.BOTTOM);
      return;
    }
    // Perform the signup logic here
    const api="http://devapiv4.dealsdray.com/api/v2/user/email/referral";

    Map<String,String> headers={
      "Content-Type": "application/json",
    };

    Map<String,dynamic> body={
      "email":mailController.text,
      "password":passwordController.text,
      // "referralCode":referalController.text ,
      "userId":"62a833766ec5dafd6780fc85"
      };
    print(jsonEncode(body));

  try {
          final response=await http.post(
          Uri.parse(api),
          headers: headers,
          body: json.encode(body)
          );

          if (response.statusCode == 200 || response.statusCode ==202) {
            print(response.body);
            Get.snackbar("Success", "Registration successfully",snackPosition: SnackPosition.BOTTOM);
            Get.offAll(const BottomNavigation());
          } else {
            print("Error: ${response.statusCode}");
            Get.snackbar("Error", "Failed to send ");
            // Get.to(const SignupPage());
          }
          

        } catch (e) {
          print(e);
        }

    // Reset the form
    mailController.clear();
    passwordController.clear();
    referalController.clear();
  }
}