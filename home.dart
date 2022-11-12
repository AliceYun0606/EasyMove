import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testingproject/dummy_order.dart';

const String url = "awcgroup.com.my";
const String unencodedPath = "/easymovenpick.com/api/driver_on_off.php";
final Map<String, String> headers = {'Content-Type': 'application/json; charset=UTF-8'};

void makePostRequest(String url, String unencodedPath , Map<String, String> header, Map<String,String> requestBody) async {
  final response = await http.post(
      Uri.http(url,unencodedPath),
      body: requestBody
  );
  print(response.statusCode);
  print(response.body);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, this.onPush});
  final String title;
  final ValueChanged<int>? onPush;

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  bool isSwitched = false;
  var textValue = 'off';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            _upperPart(),
            _orderCard(),
          ],
        ),
      ),
    );
  }

  Widget _upperPart() {
    return Container(
      child: Row(
        children: [
          _driverProfile(),
          _statusSwitch(),
        ]
      ),
    );
  }

  Widget _driverProfile() {
    return Container( // 'Hi Driver' Text
      margin: EdgeInsets.only(left: 20, top:0, right:0, bottom:0),,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text(
            "Hi Driver",
            style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
          ),
          Container( // Driver Profile pic
            margin: EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/icon/profilepic.png',
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'on';

        final Map<String,String> body = {'uid': '1', 'onoff': textValue};
        makePostRequest(url, unencodedPath, headers, body);
      });
      print('Driver is Online');
    }
    else {
      setState(() {
        isSwitched = false;
        textValue = 'off';

        final Map<String,String> body = {'uid': '1', 'onoff': textValue};
        makePostRequest(url, unencodedPath, headers, body);
      });
      print('Driver is Offline');
    }
  }

  Widget _statusSwitch() {
    return Container(
        margin: EdgeInsets.only(left: 200, top:0, right:0, bottom:0),,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ Transform.scale(
                scale: 1,
                child: Switch(
                  activeColor: Colors.green,
                  activeTrackColor: Colors.green.shade300,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red.shade300,
                  value: isSwitched,
                  onChanged: toggleSwitch,
                )
            ),
              // Text('$textValue', style: TextStyle(fontSize: 20),)
            ]
        ),
    );
  }

  Widget _orderCard() {
    return Container(
        child: ListView.builder(
            itemCount:allorder.length,
            itemBuilder: (BuildContext context, int index) {
              OrderData data = allorder[index];

              return Card(
                child: ListTile (
                  title: Text(data.id),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Text(data.company),
                        Text(data.address)
                      ]
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/icon/truck.png"),
                  ),
                  tileColor: Colors.white60,
                ),
              );
            })
    );
  }
}

