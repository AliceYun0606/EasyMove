import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:driver_integrated/merit.dart';
import 'package:driver_integrated/wallet.dart';
import 'package:driver_integrated/driver.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: AccountPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({super.key, required this.title});
  final String title;

  @override
  State<AccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<AccountPage> {
  final String url = "awcgroup.com.my";
  // //merit values
  // int? merit_value;
  // String display_merit_value = "";
  // List<dynamic>? merits;
  // //wallet values
  // String? commission_value;
  // String display_commission_value = "";
  // int? wallet_merit_value;
  // String display_wallet_merit_value = "";
  // bool withdraw = false;
  // List<dynamic>? commissions;
  //values to send
  Map<String, dynamic> wallet_data = new Map<String,dynamic>();
  Map<String, dynamic> merit_data = new Map<String,dynamic>();
  //http post functions
  void makePostRequestMerit(String url, String unencodedPath, Map<String,String> requestBody) async {
    final response = await http.post(
        Uri.http(url,unencodedPath),
        // headers: header,
        body: requestBody
    );
    merit_data = json.decode(response.body);
    // merit_value = (data["merit"]);
    // merits = (data["merits"]);
    // display_wallet_merit_value = merit_value.toString();
    // print(merits?.length);
    // print(response.statusCode);
    print(merit_data);
  }

  void makePostRequestWallet(String url, String unencodedPath, Map<String,String> requestBody) async {
    final response = await http.post(
        Uri.http(url, unencodedPath),
        // headers: header,
        body: requestBody
    );
    wallet_data = json.decode(response.body);
    // commission_value = (data["commission_bonus"]);
    // wallet_merit_value = (data["withdrawable_merit"]);
    // commissions = (data["commissions"]);
    // display_commission_value = commission_value.toString();
    // display_merit_value = merit_value.toString();
    // print(response.statusCode);
    // print(wallet_data);
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 255, 168, 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _wallet(context),
            _merit(context),
            _logout(context),
          ],
        ),
        ),
    );
  }

  Widget _wallet(context)
  {
    return SizedBox(
        width: 300,
        height: 80,
        child: GFButton(
          color: Colors.orange,
          onPressed: () {
            Driver driver = Driver();
            String? user_id = driver.id.toString();
            final String unencodedPathWallet = "/easymovenpick.com/api/commission_statement.php";
            final Map<String, String> body_wallet = {'uid':user_id};
            makePostRequestWallet(url, unencodedPathWallet, body_wallet);
            Navigator.push(context,MaterialPageRoute(builder:(context) => Wallet(wallet_data)));
          },
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/wallet.png'),
          Text("Wallet",style:TextStyle(fontSize: 30)),
        ],
      ),
      shape: GFButtonShape.pills,
        )
    );
  }

  Widget _merit(context)
  {
    return SizedBox(
        height: 80,
        width: 300,
        child:GFButton(
          color: Colors.orange,
          onPressed: () {
            Driver driver = Driver();
            String? user_id = driver.id.toString();
            final String unencodedPathMerit = "/easymovenpick.com/api/merit_statement.php";
            final Map<String, String> body = {'uid':user_id};
            makePostRequestMerit(url, unencodedPathMerit, body);
            Navigator.push(context,MaterialPageRoute(builder:(context) => Merit(merit_data)));
        },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/merit.png'),
          Text("Merit",style: TextStyle(fontSize: 30),),
        ],
      ),
      shape: GFButtonShape.pills,
      ),
    );
  }

  Widget _logout(context)
  {
    return SizedBox(
        width:160,
        height:50,
        child:GFButton(
          color: Colors.orange,
          onPressed: () {
            Navigator.popUntil(context,ModalRoute.withName(Navigator.defaultRouteName));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Image.asset('assets/images/merit.png'),
              Text("Logout",style: TextStyle(fontSize: 22),),
            ],
          ),
          shape: GFButtonShape.pills,
        )
    );
  }

}
