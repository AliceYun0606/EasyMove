import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sampleproject_1/testing/list_view_2nd.dart';
import 'package:sampleproject_1/main.dart';
import 'package:sampleproject_1/order_details_3.dart';

class MyList extends StatelessWidget {
  final String child;

  MyList({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
      child: Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
          motion: StretchMotion(),
          dismissible: DismissiblePane(
            onDismissed: () {},
          ),
          children: [
            SlidableAction(
              onPressed: ((context) {}),
              backgroundColor: Color.fromARGB(255, 255, 40, 40),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            )
          ],
        ),
        endActionPane: ActionPane(
          motion: StretchMotion(),
          dismissible: DismissiblePane(
            onDismissed: () {},
          ),
          children: [
            SlidableAction(
              onPressed: ((context) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => order_details_before()));
              }),
              backgroundColor: Color.fromARGB(255, 208, 208, 208),
              foregroundColor: Colors.white,
              icon: Icons.more,
              label: 'More',
            ),
            SlidableAction(
              onPressed: ((context) {}),
              backgroundColor: Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.arrow_left,
              label: 'Accept',
            ),
          ],
        ),
        child: Container(
          width: 500,
          color: Color.fromARGB(255, 246, 232, 206),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text(child, textAlign: TextAlign.start),
        ),
      ),
    );
  }
}
