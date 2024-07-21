import 'package:e_commerce_exam/utils/products.dart';
import 'package:e_commerce_exam/views/screens/extensions.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selected = "All";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('cart_page');
            }
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButton(
                  value: selected,
                  items: [
                    DropdownMenuItem(
                      value: "All",
                      child: Text("All"),
                    ),
                    ...allCategories.map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.tcase),
                      ),
                    ),
                  ],
                  onChanged: (val) {
                    selected = val ?? "All";
                    setState(() {});
                  },
                ),
                10.w,
                Visibility(
                  visible: selected!= "All",
                  child: ActionChip(
                    avatar: Icon(Icons.clear_rounded),
                    label: Text("Clear"),
                    onPressed: (){
                      selected = "All";
                      setState(() {});
                    }
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: allProducts.where((element) => selected == "All"
                  ?true
                  :element['category'] == selected
                )
                .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('detail_page',
                      arguments: e
                    );
                  
                  },
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.44,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10,bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3, 3),
                          blurRadius: 5,
                        ),
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: NetworkImage(e['thumbnail']),
                        ),
                        Text(
                          e['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,                  
                        ),
                        Text(
                          "${e['price']}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          e['description'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        6.h,
                        const Spacer(),
                        // RatingBar.builder(
                        //   initialRating: e['rating'],
                        //   direction: Axis.horizontal,
                        //   itemCount: 5,
                        //   itemSize: 16,
                        //   itemBuilder: (context, _) => const Icon(
                        //     Icons.star,
                        //     color: Colors.amber,
                        //   ),
                        //   onRatingUpdate: (rating) {
                        //   },
                        // ),
                        TextButton.icon(
                          onPressed: (){
                            if(!cartitems.contains(e)){
                              cartitems.add(e);
                              e['qty'] = 1;
                             }
                            setState(() {});
                          },
                          icon: Icon(Icons.shopping_cart_checkout_rounded),
                          label: Text("Add to Cart"),
                        ),
                      ],
                    ),
                  ),
                ),
                ).toList(),
              ),
            ),
          ],
        ),        
      ),
    );
  }
}

// Container(
//             child: Text(e['title']),
//           )


//child: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //        FlexibleGridView(
        //       children: allProducts.map((e) => Container(
        //         child: Row(
        //           children: [
        //             Text(e['title']),
        //           ],
        //         )
        //       )).toList(),
        //       ),
        //     ]
        //   ),
        // ),