import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';


   DeviceInfoPlugin deviceInfoPlugin =  DeviceInfoPlugin();

   DeviceInfo()async {
   if(Platform.isAndroid){
   AndroidDeviceInfo androidDeviceInfo=await deviceInfoPlugin.androidInfo;
   return androidDeviceInfo;
   }
   else if(Platform.isIOS){
    IosDeviceInfo iosDeviceInfo=await deviceInfoPlugin.iosInfo;
    return iosDeviceInfo;
   }
   else{
    return "Platfrom Not Supported";
   }
  
}


  Future<String> androidDevieId() async{
    AndroidDeviceInfo androidDeviceInfo=await deviceInfoPlugin.androidInfo;
    return androidDeviceInfo.id;
  }
