import 'package:flutter/material.dart';
import 'main.dart';

class Detail extends StatefulWidget {
  Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    final food2 = ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Page",
          style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25 ),
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "Bills_pages");
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
        ),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              margin: EdgeInsets.only(top: 420),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 20,
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Color(0xffFFFFFF)),
            ),
            Positioned(
              top: 230 - 280,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Container(
                    height: 500,
                    width: 300,
                    child: Image.network(food2?["img"] ?? ""),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35, top: 35),
                        child: Row(
                          children: [
                            Text(
                              food2?["name"] ?? "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 35),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  "\t\t\t\t\t\t\t\t\tLorem ipsum dolor sit amet, consectetur\n \t\t\t\t\t\t\t\t\tadipiscing elit, sed do eiusmod tempor incididunt ut\n \t\t\t\t\t\t\t\t\tlabore et dolore magna aliqua. Ut enim ad ",
                              style: TextStyle(
                                  color: Color(0xffADAEAF),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: "Read More",
                              style: TextStyle(
                                  color: Color(0xff5CC24A),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500))
                        ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40,left: 320),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                              color: Color(0xffFB5151)),
                          child: InkWell(
                              onTap: () {
                                if (food2 != 0) {
                                  Billlist.add(food2!);
                                }
                                Navigator.pushNamed(context, "Bills_pages");
                              },
                              child: Center(
                                  child: Icon(
                                Icons.shopping_cart_checkout,size: 30,
                                    color: Colors.white,
                              ))),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
