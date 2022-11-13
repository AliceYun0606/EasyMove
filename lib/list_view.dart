import 'package:flutter/material.dart';
import 'package:sampleproject_1/list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sampleproject_1/_order_json_format.dart';

void main() {
  runApp(const list_view());
}

class list_view extends StatelessWidget {
  const list_view({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const OrderList(title: 'Order List'),
    );
  }
}

class OrderList extends StatefulWidget {
  const OrderList({super.key, required this.title});
  final String title;

  @override
  State<OrderList> createState() => _MyListPageState();
}

class _MyListPageState extends State<OrderList> {
  String url = "awcgroup.com.my";
  String unencodedPath = "/easymovenpick.com/api/driver_order.php";
  String? response_message;
  final Map<String, String> _orders_data = {"oid": "1", "origin": "Kuching"};
  /*List<Map> _myOrders = [
    {"uid": "1"}
  ];*/
  final Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  //final response = await http.post(Uri.http(url, unencodedPath), body:body);

  /*getAllProduct() async {
    var response = await http.post(Uri.http(url, unencodedPath));
    if (response.statusCode == 200) {
      setState(() {
        _orders_data = json.decode(response.body);
      });
      print(_orders_data);
      return _orders_data;
    }
  }*/

  //testing
  makePostRequest(String url, String unencodedPath, Map<String, String> headers,
      Map<String, String> _orders_data) async {
    final response =
        await http.post(Uri.http(url, unencodedPath), body: _orders_data);
    final data = json.decode(response.body);
    print(response.statusCode.toString());
    print(response_message.toString());
    if (response.statusCode == 200) {
      print("test");
    } else {
      print("no order");
    }
  }

  //test 3
  /*Future<List<Map>> getData() async {
    http.Response response = await http.get(Uri.http(url, unencodedPath));
    print(response.body.toString());
    return json.decode(response.body);
  }*/

  /*List orderList = [];
  getAllOrder() async {
    var response = await http.post(Uri.http(url, unencodedPath));
    if (response.statusCode == 200) {
      setState(() {
        orderList = json.decode(response.body);
      });
      print(orderList);
      return orderList;
    }
  }*/

  final List _orders = [
    "McDonald",
    "KFC",
    "The Spring",
    "VivaCity",
    "Lao Jie Fang Kopitiam",
    "Starbucks",
    "Magic Bites"
  ];
  final List _orders2 = [
    "Green Height",
    "Taman BDC",
    "Taman Lee Ling Heights",
    "Jalan Tabuan",
    "Hui Sing Garden",
    "Richmond Hills",
    "Saradise"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: DefaultTabController(
            length: 4,
            child: TabBar(isScrollable: true, tabs: [
              Tab(
                text: 'All Orders',
              ),
              Tab(
                text: 'Nearby Orders',
              ),
              Tab(
                text: 'Accepted Orders',
              ),
              Tab(
                text: 'Orders History',
              ),
            ]),
          ),
        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          return MyList(
            child:
                /*"Pick Up Location: \n" +
                _orders[index] +
                "\n\nDrop Off Location: \n" +
                _orders2[index],*/
                makePostRequest(url, unencodedPath, headers, _orders_data)
                    .toString(),
          );
        },
      ),
    );
  }
}
