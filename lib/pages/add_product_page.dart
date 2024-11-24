import 'package:flutter/material.dart';
import 'package:footwarea/controller/home_controller.dart';
import 'package:get/get.dart';

import '../widgets/drop_down_btn.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add product',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Add New Product',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: const Text('Product Name'),
                      hintText: 'Enter Your product Name'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: const Text('Product Description'),
                      hintText: 'Enter Your Product description'),
                  maxLines: 4,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrl.productImgCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: const Text('Image Url'),
                      hintText: 'Enter Image Url'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: const Text('Product Price'),
                      hintText: 'Enter Your product Price'),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                        child: DropDownBtn(
                      items: const [
                        'Boots',
                        'Fashion',
                        'Laptop',
                        'Electronics',
                        'shoes',
                        'Bags'
                      ],
                      selectedItemText: ctrl.category,
                      onSelected: (selectedValue) {
                        ctrl.category = selectedValue ?? 'general';
                        ctrl.update();
                      },
                    )),
                    Flexible(
                        child: DropDownBtn(
                      items: const [
                        'puma',
                        'Adidas',
                        'Aarong',
                        'ChipChamber',
                        'Kay Kraft',
                        'Rang',
                        'Apple',
                        'HP',
                        ' CircuitCove',
                        'Lenovo',
                        'Gucci',
                        'Louis Vuitton',
                        'Bata'
                      ],
                      selectedItemText: ctrl.brand,
                      onSelected: (selectedValue) {
                        ctrl.brand = selectedValue ?? 'un branded';
                        ctrl.update();
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Offer Product ?'),
                const SizedBox(height: 10),
                DropDownBtn(
                  items: const ['true', 'False'],
                  selectedItemText: ctrl.offer.toString(),
                  onSelected: (selectedValue) {
                    ctrl.offer =
                        bool.tryParse(selectedValue ?? 'false') ?? false;
                    ctrl.update();
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      ctrl.addProduct();
                    },
                    child: const Text('Add Product')),
              ],
            ),
          ),
        ),
      );
    });
  }
}
