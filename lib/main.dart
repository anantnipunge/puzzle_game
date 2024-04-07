import 'package:flutter/material.dart';
import 'package:puzzle/pages/home.dart';
import 'package:puzzle/pages/onboard.dart';
import 'package:puzzle/utils/routes.dart';
import 'package:puzzle/widgets/drawer.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initalizing hive
  await Hive.initFlutter();
  var highbox = await Hive.openBox("HighScore_db");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/splash",
      routes: {
        "/": (context) => HomePage(),
        Myroutes.drawerRoute: (context) => const DrawerPage(
              high: 0,
            ),
        "/splash": (context) => const SplashScreen(),
      },
    );
  }
}
