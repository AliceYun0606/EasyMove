import 'package:flutter/material.dart';
import 'package:sampleproject_1/list_view.dart';
import 'package:sampleproject_1/order_details_3.dart';

class MyList extends StatelessWidget {
  final String child;

  MyList({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
      child: Dismissible(
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const order_details_before()));
          } else if (direction == DismissDirection.endToStart) {
            myAlertBox(context);
          }
        },
        key: UniqueKey(),
        background: Container(
          color: const Color.fromARGB(255, 208, 208, 208),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.more),
              Text(
                "More",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        secondaryBackground: Container(
          color: const Color(0xFF7BC043),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_left),
              Text(
                "Accept",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        child: Container(
          width: 500,
          color: const Color.fromARGB(255, 246, 232, 206),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text(child, textAlign: TextAlign.start),
        ),
      ),
    );
  }

  void myAlertBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text("Are you sure to accept this order?"),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const list_view())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: const Text(
                      "No",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Order Accepted");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const list_view()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7BC043),
                    ),
                    child: const Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
