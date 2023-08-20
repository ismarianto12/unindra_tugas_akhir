import 'package:penitipan/pages/dashboard.dart';
import 'package:penitipan/pages/dashboardUser.dart';
import 'package:penitipan/pages/listdata.dart';
import 'package:penitipan/pages/productcat.dart';
import 'package:penitipan/pages/user/profile.dart';
import 'package:penitipan/pages/tatacara.dart';
import 'package:penitipan/pages/lokasi.dart';

import 'package:flutter/material.dart';

class NavigateUser extends StatefulWidget {
  const NavigateUser({Key? key}) : super(key: key);

  @override
  State<NavigateUser> createState() => _NavigateUserState();
}

class _NavigateUserState extends State<NavigateUser> {
  int index_color = 0;
  List<Widget> screens = [
    DashboarUser(),
    TataCara(),
    Lokasi(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index_color],
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/tambahpenitipan");
        },
        backgroundColor: const Color.fromARGB(255, 3, 95, 170),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
