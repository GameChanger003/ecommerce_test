import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_test/features/Store/Controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final ProductsController _products=Get.put(ProductsController());

    return Scaffold(
    appBar: AppBar(
      toolbarHeight: 100,
      leading: IconButton( onPressed: (){
        _products.fetchProducts();
      },icon:  const Icon(Icons.menu_outlined)),
      title: TextFormField(
        decoration:  InputDecoration(
          fillColor: Colors.redAccent,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage("Assets/logo/company_logo.png"),height:4,width: 4,),
        ),
        suffixIcon: const Icon(Icons.search),
        hintText: 'Search here',
    
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        
      ),),
      actions: [
        IconButton(onPressed: (){
          print("Checonh ${_products.allbanners}");
        }, icon: const Icon(Icons.notifications_outlined))
      ],
      ),   
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Obx((){
              if (_products.islaoding.value) {
                return const Center(
                      child: CircularProgressIndicator(),
                    );
              }
              else{
                return SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _products.categorieslisting?.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item=_products.categorieslisting?[index];
                      final img=item['icon'];
                      return Container(
                        width: 250,
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              Image(image: NetworkImage(img)),
                              Text(item['offer']),
                              Text(item['label'])
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
                      }
                    }),
                  ),
        ),
      ),
            );
          }
        }

        class bannersliderWidget extends StatelessWidget {
          const bannersliderWidget({
            super.key,
            required ProductsController products,
          }) : _products = products;

          final ProductsController _products;

          @override
          Widget build(BuildContext context) {
            return CarouselSlider.builder(
              itemCount: _products.allbanners?.length,
              itemBuilder: ( context, index, realindex){
                String imageUrl = _products.allbanners?[index]['banner']!;
                return SizedBox(child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.network(imageUrl,fit: BoxFit.fill,)));
              },
                options: CarouselOptions(
                      height: 175,
                      aspectRatio: 16/9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: null,
                      scrollDirection: Axis.horizontal,
                  ),
                );
  }
}

class KYCWidget extends StatelessWidget {
  const KYCWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    //  height: 200,
    //  width: double.infinity,
     child: Container(
       margin: const EdgeInsets.all(30),
       padding: const EdgeInsets.all(25),
       decoration: BoxDecoration(
       color: Colors.blue,
       borderRadius: BorderRadius.circular(12)
       ),
       child: const Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children:[
       Text("KYC pending",style: TextStyle(color: Colors.white),),
       Text("You need to provide the required documents for your account activation",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),
       Text("Click here",style: TextStyle(color: Colors.white,decoration: TextDecoration.underline,decorationColor: Colors.white))
       ] )
     ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       cateWidget(text: const Text("Mobile"),icon: const Icon(Icons.ad_units_rounded),color: Colors.blue),
       cateWidget(text: const Text("Laptop"),icon: const Icon(Icons.laptop),color: Colors.greenAccent),
       cateWidget(text: const Text("Camera"),icon: const Icon(Icons.camera_alt_rounded),color: Colors.redAccent),
       cateWidget(text: const Text("LED"),icon: const Icon(Icons.lightbulb),color: Colors.orangeAccent),
     ],
    );
  }
}

class cateWidget extends StatelessWidget {
  Text text;
  Icon icon;
  Color color;
   cateWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: color
              ),
              child: icon,
            ),
          ),
          text
        ],
      ),
    );
  }
}