import 'package:e_commerce_exam/utils/products.dart';
import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> product = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          
          child: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: const Text("Detail Page"), 
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed('cart_page');
          },
            icon: Icon(
              Icons.shopping_cart_rounded
            ),
          ),
          
        ],  
      ),

      body: Center(
        child: Column(          
          children: [
            SizedBox(height: size.height *0.04),
            SizedBox(
              height: size.height *0.1,
              child: Text(
                product['title'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Image(
              image: NetworkImage(product['thumbnail']),
            ),
            SizedBox(height: size.height*0.04),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\$${product['price']}",
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04,),
            Text(
              product['description'],  
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(!cartitems.contains(product)) {
            cartitems.add(product);
            
            product['qty'] = 1;
          }
        },
        child: Icon(
          Icons.add_shopping_cart_rounded,
        ), 
      ),
   
    );
  }
}