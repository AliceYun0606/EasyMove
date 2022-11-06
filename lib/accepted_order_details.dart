import 'package:flutter/material.dart';

void main() => runApp(Order_details());

class Order_details extends StatelessWidget {
  const Order_details({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Details Page',
      home: _RowOrder(),
    );
  }
}

class _RowOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: 1000,
        child: Column(children: [
          Container(
            height: 35,
            margin: const EdgeInsets.only(top: 0, bottom: 0),
            child: Row(
              children: [
                Container(padding: const EdgeInsets.only(left: 10, right: 10)),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                      child: const Text('Order ID:',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(220, 5, 5, 0),
                      child: const Text('#10001',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            color: Color.fromARGB(255, 246, 232, 206),
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            child: Row(
              children: [
                Container(padding: const EdgeInsets.only(left: 10, right: 10)),
                Image.asset(
                  "images/sushi_king.jpeg",
                  width: 100,
                  height: 100,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: const Text('Merchant:',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: const Text('Sushi King',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            color: const Color.fromARGB(255, 246, 232, 206),
            margin: const EdgeInsets.only(bottom: 0),
            child: Row(
              children: [
                Container(padding: const EdgeInsets.only(left: 0, right: 10)),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                      child: const Text('Pick Up Location:',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 0, right: 10),
                          child: const Text('The Spring',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            color: const Color.fromARGB(255, 246, 232, 206),
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Container(padding: const EdgeInsets.only(left: 0, right: 10)),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                      child: const Text('Drop off Location:',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 0, right: 10),
                          child: const Text('Taman BDC',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 334,
            color: const Color.fromARGB(255, 246, 232, 206),
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Container(padding: const EdgeInsets.only(left: 0, right: 10)),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                      child: const Text('Trips Distance: ',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                          child: const Text('4.2km',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
