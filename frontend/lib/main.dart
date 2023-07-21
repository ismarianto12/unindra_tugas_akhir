import 'package:penitipan/components/Navigate.dart';
import 'package:penitipan/components/NavigateUser.dart';
import 'package:penitipan/pages/dashboard.dart';
import 'package:penitipan/pages/dashboardUser.dart';
import 'package:penitipan/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:penitipan/route.dart';
import 'package:penitipan/service/middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? storedValue;
  String? levelid;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String? value = await Middleware.accesslogin("Login");
    String? level = await Middleware.accesslogin("level");

    setState(() {
      levelid = level;
      storedValue = value;
    });
  }

  Future<String?> getLevelId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('level');
  }

  @override
  Widget build(BuildContext context) {
    print(levelid.toString() != null);
    return MaterialApp(
      onGenerateRoute: MyRouter.generateRoute,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
      ),
      home: FutureBuilder<String?>(
        future: getLevelId(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Login();
          } else {
            String? levelId = snapshot.data;
            if (levelId == "1") {
              return Navigate();
            } else if (levelId == "2") {
              return NavigateUser();
            } else {
              return Login();
            }
          }
        },
      ),
    );
  }
}
