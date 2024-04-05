import 'package:flutter/material.dart';
import 'main.dart';

class Billpage extends StatefulWidget {
  Billpage({super.key});

  @override
  State<Billpage> createState() => _BillpageState();
}

class _BillpageState extends State<Billpage> {
  double a = 3.50;

  @override
  Widget build(BuildContext context) {
    double subtotal = subtotals();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Color(0xffFFFFFF)),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20),
                  child: Text(
                    "Subtotal",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 200),
                  child: Text(
                    "\$$subtotal",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1.9,
                width: 370,
                color: Color(0xffADAEAF),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "Delivery",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 220),
                  child: Text(
                    "\$$a",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1.9,
                width: 370,
                color: Color(0xffADAEAF),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 230),
                  child: Text(
                    "\$${subtotal + a}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 70,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff5ED240)),
                child: Center(
                    child: Text(
                      "CHECKOUT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xffD2D2D2),
          ),
          Container(
            height: double.infinity,
            margin: EdgeInsets.only(top: 150),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Color(0xffF9F8FD)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: SingleChildScrollView(
              child: Column(
                  children: Billlist.map((e) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 20),
                          height: 100,
                          width: 380,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color(0xffFFFFFF)),
                          child: Row(
                            children: [
                              Image.network(e["img"] ?? "", height: 130),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20,right: 130),
                                    child: Text(
                                      e["name"],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 150, top: 5),
                                        child: Text(
                                          "\$" + e["price"].toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Text(
                                        "\$" +
                                            (e["quantity"] * e["price"])
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: 16, color: Color(0xffADAEAF)),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 30,
                          right: 20,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (e["quantity"] > 1) {
                                    e["quantity"] = e["quantity"] - 1;
                                    setState(() {});
                                  } else {
                                    Billlist.remove(e);
                                    setState(() {});
                                  }
                                },
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 20),
                                  child: Icon(Icons.remove_circle),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10),
                                child: Text(
                                  e["quantity"].toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    e["quantity"] = e["quantity"] + 1;
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10),
                                    child: Icon(
                                        Icons.add_circle_rounded),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text("Cart",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/");
                    setState(() {});
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 510, left: 15),
            height: 65,
            width: 380,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xffFFFFFF)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child:
                  Icon(Icons.qr_code_scanner_rounded, color: Color(0xffADAEAF), size: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text("Promo Code",
                      style: TextStyle(color: Color(0xffADAEAF), fontSize: 15)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            color: Color(0xff5ED240),
                            spreadRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff5ED240)),
                    child: Center(
                        child: Text(
                          "Apply",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  double subtotals() {
    double subtotal = 0;
    Billlist.forEach((e) {
      subtotal += e["quantity"] * e["price"];
    });
    return subtotal;
  }
}