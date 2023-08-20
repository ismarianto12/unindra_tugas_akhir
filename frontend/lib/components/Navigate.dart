import 'package:penitipan/pages/dashboard.dart';
import 'package:penitipan/pages/listdata.dart';
import 'package:penitipan/pages/tatacara.dart';
import 'package:penitipan/pages/lokasi.dart';

import 'package:penitipan/pages/productcat.dart';
import 'package:penitipan/pages/user/profile.dart';

import 'package:flutter/material.dart';

class Navigate extends StatefulWidget {
  const Navigate({Key? key}) : super(key: key);

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int index_color = 0;
  List<Widget> screens = [
    Dashboard(),
    TataCara(),
    Lokasi(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: screens[index_color],
      bottomNavigationBar: BottomAppBar(
        height: 55,
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.purple],
            ),
          ),
          height:
              kToolbarHeight, // Set ukuran tinggi BottomAppBar sesuai dengan kToolbarHeight
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: index_color == 0 ? Colors.green : Colors.green[100],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart,
                  size: 30,
                  color: index_color == 1
                      ? const Color.fromARGB(255, 204, 207, 204)
                      : Colors.green[100],
                ),
              ),
              SizedBox(
                width: 60, // Set lebar SizedBox sesuai dengan ukuran ikon
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.verified_user,
                  size: 30,
                  color: index_color == 2 ? Colors.green : Colors.green[100],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.supervised_user_circle,
                  size: 30,
                  color: index_color == 3 ? Colors.green : Colors.green[100],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
