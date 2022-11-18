import 'package:flutter/material.dart';
//import 'package:sampleproject_1/list_view.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const Order_details());

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
  openMapsList(context) async {
    try {
      final coords = Coords(37.759392, -122.5107336);
      final title = "Demo";
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
        centerTitle: true,
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
                        padding: const EdgeInsets.only(left: 10, right: 10)),
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
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
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
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 0, right: 10)),
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
                              padding:
                                  const EdgeInsets.only(left: 0, right: 10),
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
                    Container(
                        padding: const EdgeInsets.only(left: 0, right: 10)),
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
                              padding:
                                  const EdgeInsets.only(left: 0, right: 10),
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
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 0, right: 10)),
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
              Container(
                height: 334,
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
                    Container(
                        padding: const EdgeInsets.only(left: 0, right: 10)),
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
