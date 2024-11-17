// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_test/features/Store/Controller/products_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

      final ProductsController _products=Get.put(ProductsController());


      fetchBaners() {
         var allbaners=[];
           _products.bannerOne?.forEach((e)=>allbaners.add(e));
            _products.bannertwo?.forEach((e)=>allbaners.add(e));
            _products.bannerthree?.forEach((e)=>allbaners.add(e));
            print("${ _products.AllBanners()}");
          // return allbaners;
        }

  @override
  Widget build(BuildContext context){
  
    return   Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx((){
           if (_products.islaoding.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
          return Column(       
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          bannersliderWidget(products: _products),
           const KYCWidget(),
           CaregoriesListWidget(products: _products),
           DealsWidgets(products: _products),
          ]
          );
          }
          }
        )),
      )
    );
  }
}

class DealsWidgets extends StatelessWidget {
  const DealsWidgets({
    super.key,
    required ProductsController products,
  }) : _products = products;

  final ProductsController _products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
       padding: EdgeInsets.all(20),
       decoration: BoxDecoration(
         color: Colors.cyan[300]
       ),
        child: Column(
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Exclusive for you",style: TextStyle(fontSize: 30,color: Colors.white)),
               IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right_alt_outlined,color: Colors.white,))
             ],
           ),
            SizedBox(
             height: 220,
             child: ListView.builder(
             scrollDirection: Axis.horizontal,
             shrinkWrap: true,
               itemCount: _products.categorieslisting?.length,
               itemBuilder: (BuildContext context, int index) {
               final item=_products.categorieslisting?[index];
              final img=item['icon'];
                 return Card(
                   elevation: 5,
                   child: Container(
                     height: 300,
                     width: 200,
                     decoration: BoxDecoration(
                       ),
                     child: Stack(
                       children: [
                       Positioned(
                         top: 30,
                         right: 0,
                         left: 0,
                         bottom: 30,
                         child: Image(image: NetworkImage(img),fit: BoxFit.contain,)),
                       Positioned(
                     top: 0,
                     right: 0,
                     child: Container(
                       height: 30,
                       margin: EdgeInsets.all(15),
                       padding: EdgeInsets.all(5),
                       decoration: BoxDecoration(
                         color: Colors.green,
                         borderRadius: BorderRadius.circular(7)
                       ),
                       child: Text("${item['offer']} Off"))),
                       Positioned(
                         bottom: 0,
                         left: 10,
                         child: Text(item['label']))
                       ],
                     ),
                   ),
                 );
               },
             ),
            ),
          ],
        ),
      ),
    );
  }
}

class CaregoriesListWidget extends StatelessWidget {
  const CaregoriesListWidget({
    super.key,
    required ProductsController products,
  }) : _products = products;

  final ProductsController _products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 150,
     child: ListView.builder(
       scrollDirection: Axis.horizontal,
       shrinkWrap: true,
       itemCount: _products.category?.length,
       itemBuilder: (BuildContext context, int index) {
         return  ClipRRect(
     child: Column(
       children: [
         Container(
          padding: EdgeInsets.all( 20),
           child: Image.network(_products.category?[index]['icon']),
         ),
         Text(_products.category?[index]['label'])
       ],
     ),
              );
       },
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
       color: Colors.blue[600],
       borderRadius: BorderRadius.circular(12)
       ),
       child: const Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children:[
       Text("KYC pending",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
       Text("You need to provide the required documents for your account activation",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),
       Text("Click here",style: TextStyle(color: Colors.white,decoration: TextDecoration.underline,decorationColor: Colors.white,fontSize: 22))
       ] )
     ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required ProductsController products,
  }): _products = products;

  final ProductsController _products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _products.category?.length,
        itemBuilder: (BuildContext context, int index) {
          return cateWidget(text: Text(_products.category?[index]['label']),image : _products.category?[index]['icon'], color: Colors.blue);
        },
      ),
      // child: Row(
      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
      //  crossAxisAlignment: CrossAxisAlignment.center,
      //  children: [
      //    cateWidget(text: const Text("Mobile"),icon: const Icon(Icons.ad_units_rounded),color: Colors.blue),
      //    cateWidget(text: const Text("Laptop"),icon: const Icon(Icons.laptop),color: Colors.greenAccent),
      //    cateWidget(text: const Text("Camera"),icon: const Icon(Icons.camera_alt_rounded),color: Colors.redAccent),
      //    cateWidget(text: const Text("LED"),icon: const Icon(Icons.lightbulb),color: Colors.orangeAccent),
      //  ],
      // ),
    );
  }
}

class cateWidget extends StatelessWidget {
  Text text;
  String image;
  Color color;
   cateWidget({
    Key? key,
    required this.text,
    required this.image,
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
              child: Image.network(image),
            ),
          ),
          text
        ],
      ),
    );
  }
}



// options: CarouselOptions(
//                       height: 150,
//                       aspectRatio: 16/9,
//                       viewportFraction: 0.8,
//                       initialPage: 0,
//                       enableInfiniteScroll: true,
//                       reverse: false,
//                       autoPlay: true,
//                       autoPlayInterval: Duration(seconds: 3),
//                       autoPlayAnimationDuration: Duration(milliseconds: 800),
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       enlargeCenterPage: true,
//                       enlargeFactor: 0.3,
//                       onPageChanged: null,
//                       scrollDirection: Axis.horizontal,
//                   ),