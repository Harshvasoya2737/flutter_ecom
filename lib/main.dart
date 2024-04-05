import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Bills_pages.dart';
import 'Details_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => app(),
      "Details_page": (context) => Detail(),
      "Bills_pages": (context) => Billpage(),
    },
  ));
}

class app extends StatefulWidget {
  const app({super.key});

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Page",style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      backgroundColor: Color(0xffF4F4F4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1, left: 20)
            ),
            Container(
              height: 60,
              width: 600,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Color(0xffF4F4F4),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 27),
                      child: Icon(
                        Icons.search,
                        size: 29,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Search your Categories",
                      style: TextStyle(
                          color: Color(0xffADAEAF),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Icon(Icons.sync_alt_outlined),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 27, top: 20),
                  child: Row(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Smartphones ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700)),
                          ])),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: productlist1.map((e) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "Foods_page",
                                  arguments: e);
                            },
                            child: Foodies(
                              img: e["img"],
                              name: e["name"],
                              price: e["price"],
                              rating: e["rating"],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 245, top: 20),
                      child: Text("Laptops",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 27),),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: productlist2.map((e) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "Foods_pages",
                                  arguments: e);
                            },
                            child: Foodies(
                              img: e["img"],
                              name: e["name"],
                              price: e["price"],
                              rating: e["rating"],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Foodies extends StatelessWidget {
  String? img;
  double? price;
  String? name;
  double? rating;
  String? min;

  Foodies({super.key, this.img, this.price,this.name, this.rating, this.min});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 270,
            width: 180,
            margin: EdgeInsets.only(left: 17, top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffFFFFFF)),
            child: Column(
              children: [
                Image.network(
                  img ?? "",
                  height: 160,
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 1),
                  child: Row(
                    children: [
                      Text(
                        name ?? "",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 20),
                      child: Text(
                        "\$$price",
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Map> productlist1 = [
  {
    "img":
    "https://cdn.pricebaba.com/prod/images/product/mobile/59168/apple-iphone-9-raw-1665199.jpg",
    "name": "iPhone 9",
    "price": 549.00,
    "quantity":1
  },
  {
    "img":
    "https://images-cdn.ubuy.co.in/634e40218433e81d083d1061-apple-iphone-x-256gb-space-gray.jpg",
    "name": "iPhone X",
    "price": 899.00,
    "quantity":1
  },
  {
    "img":
    "https://5.imimg.com/data5/SELLER/Default/2023/8/337487292/ST/JB/TD/189620676/oneplus-nord-ce-3-5g-500x500.jpg",
    "name": "OnePlus Nord 5G",
    "price": 465.00,
    "quantity":1
  },
];

List<Map> productlist2 = [
  {
    "img":
    "https://5.imimg.com/data5/SELLER/Default/2021/1/TX/FH/WC/7808107/12-inch-macbook-computer-laptops.jpg",
    "name": "Mac Book",
    "price": 549.00,
    "quantity":1
  },
  {
    "img":
    "https://d2xamzlzrdbdbn.cloudfront.net/products/bfa36940-cbad-4609-b3a7-7bdb459f3d6d23060931_416x416.jpg",
    "name": "HP Laptop",
    "price": 899.00,
    "quantity":1
  },
  {
    "img":
    "https://m.media-amazon.com/images/I/716EDm687AL._AC_UF350,350_QL80_.jpg",
    "name": "Asus TouchPad",
    "price": 899.00,
    "quantity":1
  },
];

List<Map> Billlist = [];