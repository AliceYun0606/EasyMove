import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
            DriverProfile(),
            StatusSwitch(),
          ],
        ),
      ),
    );
  }

  Widget DriverProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Hi Driver",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Image.asset(
          'assets/icon/profilepic.png',
          height: 100,
          width: 200,
        ),
      ],
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

  Widget StatusSwitch() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            Text('$textValue', style: TextStyle(fontSize: 20),)
        ]
    );
  }
}

