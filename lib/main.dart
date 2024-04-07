// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puzzle/pages/home.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromRGBO(27, 18, 18, 1),
      statusBarColor: Color.fromRGBO(27, 18, 18, 1),
    ));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        Myroutes.drawerRoute: (context) => const DrawerPage(
              high: 0,
            ),
      },
    );
  }
}
