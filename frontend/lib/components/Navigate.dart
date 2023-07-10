import 'package:penitipan/pages/dashboard.dart';
import 'package:penitipan/pages/listdata.dart';
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
    ListData(),
    Productcat(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 135, 227),
      body: screens[index_color],
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/tambahpenitipan");
        },
        backgroundColor: Color.fromARGB(255, 3, 95, 170),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 55,
        color: Colors.blue[500],
        shape: CircularNotchedRectangle(),
        child: Container(
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
