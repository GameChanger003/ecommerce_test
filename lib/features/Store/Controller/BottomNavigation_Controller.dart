import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomnavigationController extends GetxController{
  RxInt index=0.obs;
  final screens=[Container(color: Colors.amber),Container(color: Colors.red),Container(color: Colors.blueAccent),Container(color: Colors.greenAccent),Container(color: Colors.cyan,)];

}