import 'package:e_commerce_exam/views/screens/cartpage.dart';
import 'package:e_commerce_exam/views/screens/detailpage.dart';
import 'package:e_commerce_exam/views/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const Homepage(),
        'detail_page' : (context) => const Detailpage(),
        'cart_page' : (context) => const Cartpage(),
      },
    );
  }
}