import 'package:flutter/material.dart';
//import 'package:sampleproject_1/list_view.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order/driver.dart';
import 'package:order/my_api_service.dart';
import 'package:order/my_order_details.dart';
import 'package:order/_order_json_format.dart';

void main() => runApp(const Order_details(
      oid: 00000406,
    ));

class Order_details extends StatelessWidget {
  const Order_details({super.key, required this.oid});
  final int oid;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Details Page',
      home: _RowOrder(),
    );
  }
}

//open map
class _RowOrder extends StatelessWidget {
  openMapsList(context) async {
    try {
      final coords = Coords(1.535645148278273, 110.3584012683042);
      final title = "Sushi King";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  /*
  Driver driver = Driver();

  Future<List<MyOrderDetails>> populateOrders(String orderStatus) async {
    List<MyOrderDetails> myOrders = [];
    List orderIds = await MyApiService.getOrdersId(driver.id, orderStatus);
    for (var oid in orderIds) {
      final data = await MyApiService.getOrder(oid);
      String status = data["status"].toString();
      String origin = data["origin"].toString();
      String destination = data["destination"];
      double o_coor = data["o_coor"];
      double d_coor = data["d_coor"];
      double distance = double.parse(data["distance"]);
      String collectTime = data["time"];
      String deliverTime = data["time_to_delivery"];
      MyOrderDetails myOrder = MyOrderDetails(oid, status, origin, destination,
          o_coor, d_coor, distance, collectTime, deliverTime);
      myOrders.add(myOrder);
    }
    return myOrders;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const OrderList(title: 'Order List View')));
            })),*/
        title: const Text(
          'Order Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SizedBox(
        height: 1000,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 35,
                margin: const EdgeInsets.only(top: 0, bottom: 0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                    ),
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
                height: 70,
                //color: const Color.fromARGB(255, 246, 232, 206),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 246, 232, 206),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 5, right: 0),
                    ),
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.orange,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 60, 0),
                          child: const Text('Date & Time:',
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: const Text('05/10/22 13:45:12',
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
                //color: const Color.fromARGB(255, 246, 232, 206),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 246, 232, 206),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    const Icon(
                      Icons.apartment,
                      color: Colors.orange,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
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
                //color: const Color.fromARGB(255, 246, 232, 206),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 246, 232, 206),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    const Icon(
                      Icons.person,
                      color: Colors.orange,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                          child: const Text("Customer's name:",
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 60),
                              child: const Text('Lee Xin Min',
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
                //color: const Color.fromARGB(255, 246, 232, 206),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 246, 232, 206),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    const Icon(
                      Icons.phone,
                      color: Colors.orange,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                          child: const Text("Phone number :",
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 30),
                              child: const Text('0123456789',
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
                //color: const Color.fromARGB(255, 246, 232, 206),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 246, 232, 206),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 5, right: 0)),
                    const Icon(
                      Icons.location_city,
                      color: Colors.orange,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                          child: const Text("Zone :",
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: const Text('BDC',
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
                //color: const Color.fromARGB(255, 246, 232, 206),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: const Color.fromARGB(255, 246, 232, 206),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(3, 0),
                    )
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    const Icon(
                      Icons.assistant_direction_rounded,
                      color: Colors.orange,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 70),
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
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: const Color.fromARGB(255, 246, 232, 206),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(3, 3),
                    )
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    const Icon(
                      Icons.house,
                      color: Colors.orange,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 70),
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
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 246, 232, 206),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    const Icon(
                      Icons.delivery_dining,
                      color: Colors.orange,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 80),
                              child: const Text(
                                '4.2km',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
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
                //color: const Color.fromARGB(255, 246, 232, 206),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: const Color.fromARGB(255, 246, 232, 206),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(3, 0),
                    )
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    const Icon(
                      Icons.timelapse,
                      color: Colors.orange,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: const Text('Pick Up Time:',
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 40),
                              child: const Text('03:00 PM',
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
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: const Color.fromARGB(255, 246, 232, 206),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(3, 3),
                    )
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    const Icon(
                      Icons.time_to_leave,
                      color: Colors.orange,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: const Text('Delivery Time:',
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 40),
                              child: const Text('03:15 PM',
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 246, 232, 206),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    const Icon(
                      Icons.attach_money,
                      color: Colors.orange,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                          child: const Text('Delivery Commission: ',
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 140),
                              child: const Text(
                                'RM 10',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30, bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange,
                  ),
                  child: Builder(
                    builder: (context) {
                      return MaterialButton(
                        onPressed: () => openMapsList(context),
                        child: const Text('Open Maps',
                            style: TextStyle(
                                color: Color.fromARGB(255, 246, 232, 206))),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
