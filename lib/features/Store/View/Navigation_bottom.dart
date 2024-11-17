import 'package:ecommerce_test/features/Store/View/CartPage.dart';
import 'package:ecommerce_test/features/Store/View/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {

    //init navigation controller
    final navController = Get.put(Bottomnavigation());

    //Screens for the navigation controller

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        label:  Text("Chat",style: TextStyle(color: Colors.white,fontSize: 20),),
        icon: Icon(Icons.chat_outlined,color: Colors.white),
        ),

      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 10,
          selectedIndex: navController.index.value,
          onDestinationSelected: (index)=>navController.index.value=index,
          destinations: const[
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.grid_view_outlined), label: "Categories"),
            NavigationDestination(icon: Icon(Icons.bolt_outlined), label: "Deals"),
            NavigationDestination(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            NavigationDestination(icon: Icon(Icons.person_outline_outlined), label: "Profile"),
        
          ],
        ),
      ),
      body: Obx(()=> navController.screens[navController.index.value]),
    );
  }
}

class Bottomnavigation extends GetxController{
  RxInt index=0.obs;
  final screens=[const Home(),Container(child: Center(child: Text("Categories")),),Container(child: Center(child: Text("Deals"),),),const Cartpage(),Container(child: Center(child: Text("Profile Page"),),)];

}