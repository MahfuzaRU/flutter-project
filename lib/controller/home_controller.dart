import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwarea/model/product/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'general';
  String brand = 'un brand';
  bool offer = false;

  List<ProductModel> products = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();
    super.onInit();
  }

  addProduct() {
    try {
      if (productNameCtrl.text.isEmpty ||
          productDescriptionCtrl.text.isEmpty ||
          productImgCtrl.text.isEmpty ||
          productPriceCtrl.text.isEmpty) {
        Get.snackbar('error', 'please fill all fields', colorText: Colors.red);
        return;
      }
      if (double.parse(productPriceCtrl.text) <= 0) {
        Get.snackbar('error', 'price must be greater than 0',
            colorText: Colors.red);
        return;
      }

      DocumentReference doc = productCollection.doc();
      ProductModel product = ProductModel(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: double.parse(productPriceCtrl.text),
        brand: brand,
        image: productImgCtrl.text,
        offer: offer,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('success', 'product added successfully',
          colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('error', e.toString(), colorText: Colors.green);
    }
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      // log("productSnapshot: $productSnapshot");
      final List<ProductModel> retrievedProducts = productSnapshot.docs
          .map((doc) =>
              ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar('success', 'product fetch successfully',
          colorText: Colors.green);
    } catch (e) {
      // log("error: $e");
      Get.snackbar('error', e.toString(), colorText: Colors.red);
    } finally {
      update();
    }
  }

  deleteProduct(String id) {
    try {
      productCollection.doc(id).delete();
      fetchProducts();
    } catch (e) {
      Get.snackbar('error', e.toString(), colorText: Colors.red);
    }
  }

  setValuesDefault() {
    productNameCtrl.clear();
    productPriceCtrl.clear();
    productDescriptionCtrl.clear();
    productImgCtrl.clear();
    category = 'general';
    brand = 'un brand';
    offer = false;
    update();
  }
}
