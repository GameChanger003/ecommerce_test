import 'dart:convert';
import 'package:ecommerce_test/features/Store/View/Home.dart';
import 'package:ecommerce_test/features/Store/View/Navigation_bottom.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_test/features/Auth/controllers/device_info_controller.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{
  String? otp;

  checkOTP(String code)async{
    const api="http://devapiv4.dealsdray.com/api/v2/user/otp/verification";
    Map<String,String> header={
      "Content-Type": "application/json"
    };

    Map<String,dynamic> body={
      "otp":code,
      "deviceId":await androidDevieId(),
      "userId":"62b43547c84bb6dac82e0525"
    };

    print(body);

    // try {
    //       final response=await http.post(
    //       Uri.parse(api),
    //       headers: header,
    //       body: json.encode(body)
    //       );

    //       if (response.statusCode == 200) {
    //         print(response.body);
    //           Get.offAll(Home());
    //       } else {
    //         print("Error: ${response.body}");
    //         Get.snackbar("Error", "Failed to send OTP");
    //       }
          

    //     } catch (e) {
    //       print(e);
    //     }
    
    Get.offAll(BottomNavigation());

  }
}



// {
//     "otp":"9879",
//     "deviceId":"62b43472c84bb6dac82e0504",
//     "userId":"62b43547c84bb6dac82e0525"
// }