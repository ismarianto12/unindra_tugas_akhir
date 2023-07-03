import 'package:penitipan/components/MenuGrid.dart';
import 'package:penitipan/pages/Tasklist.dart';
import 'package:flutter/material.dart';
import 'package:penitipan/pages/login.dart';
import 'package:penitipan/pages/master/master.dart';
import '../components/ItemMenu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                color: Colors.blue,
              ),
              height: 120,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              "https://img.freepik.com/free-icon/user_318-908495.jpg?w=4000",
                              height: 80,
                              width: 80,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hy Alex",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                Text("Welcome Page",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            // Divider(height: 100),
                            // SizedBox(height: 26),
                          ],
                        ),

                        // Image.network(
                        //     'https://png.pngtree.com/png-vector/20190927/ourmid/pngtree-user-icon-symbol-design-user-icon-isolated-design-png-image_1746919.jpg')
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(4),
                        child: IconButton(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            onPressed: () {
                              //navigate to login
                              _showConfirmationDialog();
                            },
                            icon: Icon(Icons.logout_rounded,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 26),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text("Halaman Admin",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      Text("Last Update : 12 Jan, 2023",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12)),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[500],
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.verified_user_sharp, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              height: 40,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MaterialButton(
                      // minWidth: 100,
                      color:
                          Color.fromARGB(255, 51, 17, 187), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      onPressed: () {
                        MaterialPageRoute(
                          builder: (context) => TaskList(),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Master User',
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    MaterialButton(
                      // minWidth: 100,
                      color:
                          Color.fromARGB(255, 187, 105, 17), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      onPressed: () {
                        Route route =
                            MaterialPageRoute(builder: (context) => Master());
                        Navigator.push(context, route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Master Satuan',
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    MaterialButton(
                      // minWidth: 100,
                      color:
                          Color.fromARGB(255, 139, 187, 17), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => Dashboard());
                        Navigator.push(context, route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Data Harga',
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    MaterialButton(
                      // minWidth: 100,
                      color:
                          Color.fromARGB(255, 243, 39, 16), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => Dashboard());
                        Navigator.push(context, route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Data Kategori',
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    MaterialButton(
                      // minWidth: 100,
                      color:
                          Color.fromARGB(255, 243, 39, 16), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => Dashboard());
                        Navigator.push(context, route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Data Categori',
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  // color: Color.fromARGB(255, 11, 189, 234),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 216, 216, 219),
                      Color.fromARGB(255, 235, 235, 236)
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
          ],
        ),
      ),
    );
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
                Text('Keluar dari aplikasi ? '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                // Tambahkan kode untuk menghapus data di sini
                Route route = MaterialPageRoute(builder: (context) => Login());
                Navigator.push(context, route);
                // Navigator.of(context).pop(); // Tutup dialog
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
