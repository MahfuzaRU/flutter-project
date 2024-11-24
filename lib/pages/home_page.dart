import 'package:flutter/material.dart';
import 'package:footwarea/controller/home_controller.dart';
import 'package:get/get.dart';

import 'add_product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ecommerce Admin',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ctrl.products[index].name),
                subtitle: Text((ctrl.products[index].price.toString())),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ctrl.deleteProduct(ctrl.products[index].id);
                  },
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const AddProductPage());
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
