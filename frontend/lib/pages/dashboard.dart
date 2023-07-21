import 'package:penitipan/components/MenuGrid.dart';
import 'package:penitipan/pages/Tasklist.dart';
import 'package:flutter/material.dart';
import 'package:penitipan/pages/login.dart';
import 'package:penitipan/pages/master/ListMaster.dart';
import 'package:penitipan/pages/master/master.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/ItemMenu.dart';
import '../components/excertile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35.0),
                bottomRight: Radius.circular(35.0),
              ),
              color: Color.fromARGB(255, 5, 123, 219),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          "https://img.freepik.com/free-icon/user_318-908495.jpg?w=4000",
                          height: 60,
                          width: 60,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hy Alex",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Welcome Page",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Halaman Admin",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Last Update : 12 Jan, 2023",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 252, 252, 252),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                // SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[500],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(4),
                    child: IconButton(
                      color: Colors.blue[500],
                      onPressed: () {
                        _showConfirmationDialog();
                      },
                      icon: Icon(
                        Icons.logout_rounded,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MaterialButton(
                  color: Color.fromARGB(255, 51, 17, 187),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      '1. Master Data',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                MaterialButton(
                  color: Color.fromARGB(255, 187, 105, 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      '2. Master Satuan',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                MaterialButton(
                  color: Color.fromARGB(255, 139, 187, 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/user');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      '3. Master User',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                MaterialButton(
                  color: Color.fromARGB(255, 243, 39, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Data Kategori',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                MaterialButton(
                  color: Color.fromARGB(255, 16, 243, 217),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Data Categori',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Row(
              children: [
                Image.network(
                  'https://static.vecteezy.com/system/resources/previews/009/392/001/non_2x/app-menu-icon-sign-symbol-design-free-png.png',
                  height: 40,
                  width: 40,
                ),
                Text(
                  "MENU UTAMA",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 235, 235, 236),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
              ),
              child: MenuGrid(
                menuItems: menuItems,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Row(
              children: [
                Image.network(
                  'https://static.vecteezy.com/system/resources/previews/009/392/001/non_2x/app-menu-icon-sign-symbol-design-free-png.png',
                  height: 40,
                  width: 40,
                ),
                Text(
                  "TOTAL PENDAPATAN",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExerciseTile(
                  color: Colors.blueAccent,
                  title: Text("Pendapatan Peminjaman"),
                  subtitle: Text("12.0000"),
                ),
                SizedBox(height: 10),
                ExerciseTile(
                  color: Colors.blueAccent,
                  title: Text("Pendapatan Penitipan"),
                  subtitle: Text("12.0000"),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  static Future<String?> logout() async {
    SharedPreferences getval = await SharedPreferences.getInstance();
    getval.remove("token");
    getval.remove("level");
    // getval.remove("id", "");
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // dialog tidak bisa ditutup dengan menekan area di luar dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Keluar dari aplikasi?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                logout();
                Route route =
                    MaterialPageRoute(builder: (context) => const Login());
                Navigator.push(context, route);

                // return exit(1); // Keluarkan app dan menghapus token yang tersimpan
              },
            ),
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
          ],
        );
      },
    );
  }
}
