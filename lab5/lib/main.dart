import 'package:exam/ViewModel/ProductService.dart';
import 'package:exam/Views/Pages/AboutPage.dart';
import 'package:flutter/material.dart';
import 'package:exam/Views/Pages/HomePage.dart';
import 'package:exam/Entity/Product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Product> products;

  MyApp({super.key})
      : products = Productservice().getAllProduct();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routes: {
        '/': (context) => Homepage(products: products),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
