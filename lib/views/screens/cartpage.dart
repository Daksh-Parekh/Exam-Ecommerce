import 'package:e_commerce_exam/utils/products.dart';
import 'package:e_commerce_exam/views/screens/extensions.dart';
import 'package:flutter/material.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cartpage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
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
                          
                        ],
                      ),
                    ),
                  ],
                ),
            )).toList(),
          
        ),
      ),
    );
  }
}