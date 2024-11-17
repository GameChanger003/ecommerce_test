import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ProductsController extends GetxController {

  RxBool islaoding = true.obs;

  List<dynamic>? category;
  List<dynamic>? products;
  List<dynamic>? bannertwo;
  List<dynamic>? newarrivals;
  List<dynamic>? bannerthree;
  List<dynamic>? categorieslisting;
  List<dynamic>? topbrands;
  List<dynamic>? brandlisting;
  List<dynamic>? topsellingproducts;
  List<dynamic>? upcominglaptops;
  List<dynamic>? featuredlaptop;
  List<dynamic>? unboxeddeals;
  List<dynamic>? mybrowsinghistory;
  List<dynamic>? bannerOne;
  List<dynamic>? allbanners;


  @override
  void onInit() async {
    super.onInit();
    fetchProducts();
  }

  fetchProducts()async{

    const api="http://devapiv4.dealsdray.com/api/v2/user/home/withoutPrice"; 
      Map<String,String> header={
          "Content-Type": "application/json"
        };

    try {
      final response=await http.get(
        Uri.parse(api),
        headers:header
        );
        if(response.statusCode==200){
          print("success");
        final json=jsonDecode(response.body);
        final data=json['data'];
        bannerOne= data["banner_one"]; 
        category=data["category"];
        products=data["products"];
        bannertwo=data["banner_two"];
        newarrivals=data["new_arrivals"];
        bannerthree=data["banner_three"];
        categorieslisting=data["categories_listing"];
        topbrands=data["top_brands"];
        brandlisting=data["brand_listing"];
        topsellingproducts=data["top_selling_products"];
        upcominglaptops=data["upcoming_laptops"];
        featuredlaptop=data["featured_laptop"];
        unboxeddeals=data["unboxed_deals"];
        mybrowsinghistory=data["my_browsing_history"];
        allbanners=await AllBanners();
        islaoding.value=false;
        }
        else{
          print("Error: ${response.body}");
        }

        print("bannerOne: ${bannerOne?.map((e)=>e["banner"])}");
        print("all: ${allbanners}");
    } catch (e) {
      print("Error at catch:${e}");
    }
  }

  AllBanners(){
    List<dynamic> allbaners=[];
    bannerOne?.forEach((e)=>allbaners.add(e));
    bannertwo?.forEach((e)=>allbaners.add(e));
    bannerthree?.forEach((e)=>allbaners.add(e));
    print(" called");
    return  allbaners;
  }
}

