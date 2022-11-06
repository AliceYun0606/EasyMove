import 'package:flutter/material.dart';
import 'package:sampleproject_1/list.dart';

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
      home: const OrderList(title: 'Order List View'),
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
        bottom: PreferredSize(
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
            child: "Pick Up Location: \n" +
                _orders[index] +
                "\n\nDrop Off Location: \n" +
                _orders2[index],
          );
        },
      ),
    );
  }
}
