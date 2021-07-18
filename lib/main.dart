import 'package:flutter/material.dart';
import 'package:insuranceapp/viewplanpage.dart';
import 'package:insuranceapp/formplanpage.dart';
import 'childcomplete.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insurance App',
      theme: ThemeData(
        primaryColor: Colors.amber[400],
      ),
      home: ViewPlanPage(),
      routes: {
        '/home': (BuildContext context) => ViewPlanPage(),
        '/formplanpage': (BuildContext context) => FormPlanPage(),
        '/childcomplete': (BuildContext context) => ChildComplete(),
        // '/webviewleave': (BuildContext context) => WebviewLeave(),
        // '/webview_plugin': (BuildContext context) => WebviewPlugin(),
        // '/wholeavetoday': (BuildContext context) => WhoLeaveToday(),
        // '/fakegps': (BuildContext context) => FakeGps(),
      },
    );
  }
}
