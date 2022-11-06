import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize(
      null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'Location Test',
            channelDescription: "Notification example",
            defaultColor: Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights:true,
            enableVibration: true
        )
      ]
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final cron = Cron();


  ScheduledTask? scheduledTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: scheduleTask, child: Icon(Icons.circle_notifications)),
            ElevatedButton(onPressed: cancelTask, child: const Text("Cancel")),
          ],
        ),
      ),
    );
  }

  void scheduleTask() async {

    scheduledTask = cron.schedule(Schedule.parse('*/20 * * * * *'), () async=> {
      print('Every 20 Second ' + DateTime.now().toString()),
      await AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 1,
              channelKey: 'key1',
              title:'Location Tracking',
              body: 'Latitude: --, Longitude: --'
          )
      )
    });
  }

  void cancelTask() {
    scheduledTask!.cancel();
  }
}

