import 'package:driver_integrated/merit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:driver_integrated/driver.dart';
import 'package:driver_integrated/withdrawal.dart';

int? merit_value;
String display_merit_value = "";
List<dynamic>? merits;

class Merit extends StatefulWidget {
  final Map<String, dynamic> text;
  const Merit(this.text);
  @override
  meritPageState createState() {
    return meritPageState();
  }
}

class meritPageState extends State<Merit> {
  @override
  void initState() {
    super.initState();

    final data = widget.text;
    print(widget.text["merit"]);
    // final merit_value = (data?["merit"]);
    // final merits = (data?["merits"]);
    // final display_merit_value = merit_value.toString()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Merit", style: const TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 255, 168, 0),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                _meritscore(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    YearFilterDropdown(),
                    MonthFilterDropdown(),
                    ResetFilterButton(),
                  ],
                ),
                _headings(),
                _meritlist(),

              ],
            )));
  }

  //display merit score
  Widget _meritscore() {
    return Container(
      margin: EdgeInsets.only(left: 50, right: 50, top: 20),
      padding: EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 0.1),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
            )
          ]
      ),
      child: Column(
        children: [
          Container(
            height: 70,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _meritvalue(),
                // Image.asset('assets/images/merit.png'),
              ],
            ),
          ),
          Text("MERIT SCORE",
            style: TextStyle(fontSize: 20, color: Colors.orange),),
        ],
      ),
    );
  }

  //merit score value
  Widget _meritvalue() {
    if (widget.text["merit"].toString() != null) {
      return Text(widget.text["merit"].toString(),
          style: TextStyle(fontSize: 50, color: Colors.orange));
    } else {
      return Text("Loading");
    }
  }

  //merit list headers
  Widget _headings() {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 45, right: 50),
      child: Row(
        children: [
          Expanded(child: Text("Date")),
          Expanded(child: Text("Description")),
          Expanded(child: Text("Order ID")),
          Text("Points"),
        ],
      ),
    );
  }

  //show merit list depending on filter
  Widget _meritlist() {
    if (widget.text["message"] == "Get merit successfully" &&
        month_value == "--------" && year_value == "----") {
      return default_meritlist();
    } else if (year_value != "----" && month_value == "--------") {
      return year_meritlist();
    } else if (year_value != "----" && month_value != "--------") {
      return month_meritlist();
    } else {
      return Text("Loading");
    }
  }


  Widget default_meritlist() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.text.length+1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            padding: EdgeInsets.only(left: 45, right: 50),
            child: Row(
              children: [
                Expanded(
                  child: Text('${widget.text["merits"][index]["date"]}'),),
                Expanded(
                  child: Text('${widget.text["merits"][index]["note"]}'),),
                Expanded(child: Text(
                    '${widget.text["merits"][index]["order_id"]}'),),
                Text('${widget.text["merits"][index]["points"]}p'),
              ],
            ),
          );
        }
    );
  }

  Widget year_meritlist() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.text.length+1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            padding: EdgeInsets.only(left: 45, right: 50),
            child: _filter_list_by_year(widget.text, index),
          );
        }
    );
  }

  Widget month_meritlist() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.text.length+1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            padding: EdgeInsets.only(left: 45, right: 50),
            child: _filter_list_by_month(widget.text, index),
          );
        }
    );
  }

  //returns filtered data by year
  Widget _filter_list_by_year(Map<String, dynamic> text, int index) {
    if (text["merits"][index]["date"].toString().substring(6, 8) ==
        year_value.substring(2, 4)) {
      return Row(
        children: [
          Expanded(child: Text('${text["merits"][index]["date"]}'),),
          Expanded(child: Text('${text["merits"][index]["note"]}'),),
          Expanded(child: Text('${text["merits"][index]["order_id"]}'),),
          Text('${widget.text["merits"][index]["points"]}p'),
        ],
      );
    } else {
      return Text("");
    }
  }

  //returns filtered data by month
  Widget _filter_list_by_month(Map<String, dynamic> text, int index) {
    // if (month_value == "January") {
    //   month_value_num = 1;
    // }else if (month_value == "February") {
    //   month_value_num = 2;
    // }else if (month_value == "March") {
    //   month_value_num = 3;
    // }else if (month_value == "April") {
    //   month_value_num = 4;
    // }else if (month_value == "May") {
    //   month_value_num = 5;
    // }else if (month_value == "June") {
    //   month_value_num = 6;
    // }
    if (month_value == "July") {
      month_value_num = 7;
    } else if (month_value == "August") {
        month_value_num = 8;
    } else if (month_value == "September") {
        month_value_num = 9;
    } else if (month_value == "October"){
    month_value_num = 10;
    } else if(month_value == "November"){
      month_value_num = 11;
    } else if(month_value == "December"){
      month_value_num = 12;
    }

    if (text["merits"][index]["date"].toString().substring(3, 5) == month_value_num.toString()) {
      return Row(
        children: [
          Expanded(child: Text('${text["merits"][index]["date"]}'),),
          Expanded(child: Text('${text["merits"][index]["note"]}'),),
          Expanded(child: Text('${text["merits"][index]["order_id"]}'),),
          Text('${widget.text["merits"][index]["points"]}p'),
        ],
      );
    } else {
      return Text("");
    }
  }

  //filter dropdown year
  Widget YearFilterDropdown() {
    return Container(
      child: DropdownButton(
        value: year_value,
        items: year.map((String year) {
          return DropdownMenuItem(
            value: year,
            child: Text(year),
          );
        }).toList(),
        icon: const Icon(Icons.keyboard_arrow_down),
        onChanged: (String? newValue) {
          setState(() {
            year_value = newValue!;
          });
        },
      ),
    );
  }

  //filter dropdown month
  Widget MonthFilterDropdown() {
    return Container(
      child: DropdownButton(
        value: month_value,
        items: month.map((String month) {
          return DropdownMenuItem(
            value: month,
            child: Text(month),
          );
        }).toList(),
        icon: const Icon(Icons.keyboard_arrow_down),
        onChanged: (String? newValue) {
          setState(() {
            month_value = newValue!;
            if (month_value == "January") {
              month_value_num = 1;
            }else if (month_value == "February") {
              month_value_num = 2;
            }else if (month_value == "March") {
              month_value_num = 3;
            }else if (month_value == "April") {
              month_value_num = 4;
            }else if (month_value == "May") {
              month_value_num = 5;
            }else if (month_value == "June") {
              month_value_num = 6;
            }
          });
        },
      ),
    );
  }

  //filter reset button
  Widget ResetFilterButton(){
    return GFButton(
      color: Colors.orange,
      onPressed: () {
        setState(() {
          month_value = "--------";
          year_value = "----";
        });
      },
      child: Text("Reset",style: TextStyle(fontSize: 16),),
      shape: GFButtonShape.pills,
    );
  }
}

//year drop down list values
var month = [
  '--------',
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];
String month_value = '--------';

int month_value_num = 0;

//year drop down list values
var year = [
  '----',
  '2022',
  '2021',
  '2020',
  '2019',
  '2018',
];
String year_value = '----';


