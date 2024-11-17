import 'package:ecommerce_test/features/Store/Controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsController _products = Get.put(ProductsController()); 

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Shopping List",style: TextStyle(fontSize: 30),textAlign: TextAlign.start,),
              const Divider(height: 20),
              SingleChildScrollView(
                child: SizedBox(
                  height: 150,
                  child: ListView.separated(
                    itemCount: _products.mybrowsinghistory!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(height: 20,);
                      },
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image(image: NetworkImage(_products.mybrowsinghistory?[index]['icon'])),
                        title: Text("${_products.mybrowsinghistory?[index]['label']}",softWrap: true,),
                        trailing: Text("${_products.mybrowsinghistory?[index]['offer']}"),
                        );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}