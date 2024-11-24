
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footwarea/pages/add_product_page.dart';
import 'package:footwarea/pages/home_page.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';
import 'firebase_options.dart';

void main(){
   WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp(options: firebaseOptions);
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
