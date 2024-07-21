import 'package:e_commerce_exam/utils/products.dart';
import 'package:e_commerce_exam/views/screens/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  double totalprice = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void addPrice(){
    totalprice = 0;
    cartitems.forEach((e) => totalprice += e['price'] * e['qty'],
    );
  }

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);

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
        title: const Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
            }, 
            icon: Icon(
              Icons.home_rounded,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: cartitems.isEmpty
          ? Center(
            child: Text("Cart is empty"),
          )
          : Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      children: cartitems.map((e) => Container(
                      padding: EdgeInsets.all(10),
                          height: size.height * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(3, 3),
                                blurRadius: 3,
                              ),
                            ]
                          ),
                          margin: EdgeInsets.only(bottom: 10,left: 16,right: 16),
                          child: Row(
                            children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(e['thumbnail']),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                            ),
                            14.w,
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e['title'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    e['description'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey),                        
                                  ),
                                  Text("\$ ${e['price']}"),
                                  8.h,
                                  RatingBar.builder(
                                    itemSize: 25,
                                    initialRating: e['rating'],
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          e['qty']--;
                                          if(e['qty'] == 0) {
                                            cartitems.remove(e);
                                          }
                                          addPrice();
                                          setState(() {});},
                                        icon: Icon(Icons.remove),
                                      ),
                                      Text(e['qty'].toString()),
                                      IconButton(
                                        onPressed: () {
                                          e['qty']++;
                                          addPrice();
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                          ),
                      )).toList(),
                  ),
                ),
              ),
              Container(
              alignment: Alignment.center,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),                
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3, 3),
                    blurRadius: 3,
                  ),
                ]
              ),
              child: Text(
                "Price: ${totalprice.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ],
          ),
          
      ),
    );
  }
}