import 'package:penitipan/components/Navigate.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final _formKey = GlobalKey<FormState>();
  final _namabarang = TextEditingController();
  final _kategori = TextEditingController();
  final _hargajual = TextEditingController();
  final _jenis = TextEditingController();
  bool _isLooading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 3, 95, 170),
                Color.fromARGB(255, 20, 6, 75)
              ],
            ),
          ),
          child: Column(children: [
            Padding(
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
                          Text("Master Barang",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                          // Divider(height: 100),
                          // SizedBox(height: 26),
                        ],
                      ),

                      // Image.network(
                      //     'https://png.pngtree.com/png-vector/20190927/ourmid/pngtree-user-icon-symbol-design-user-icon-isolated-design-png-image_1746919.jpg')
                    ],
                  ),
                  // SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[500],
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.logout_rounded, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _namabarang,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.white) //<-- SEE HERE
                            ),
                        prefixIcon: Icon(
                          Icons.supervised_user_circle_sharp,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: Color.fromARGB(255, 255, 255, 255)),
                        // ),
                        filled: true,
                        hintText: 'Nama Barang',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value?.length == null) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _kategori,
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.access_alarms,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        hintText: 'Kategori',
                        hintStyle: TextStyle(color: Colors.white),
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.white),
                        // ),
                      ),
                      validator: (value) {
                        if (value?.length == null) {
                          return 'Masukan kategori barang';
                        }
                        return '';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _hargajual,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.white) //<-- SEE HERE
                            ),
                        prefixIcon: Icon(
                          Icons.access_alarms,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        hintText: 'Harga Jual',
                        hintStyle: TextStyle(color: Colors.white),
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.white),
                        // ),
                      ),
                      validator: (value) {
                        if (value?.length == null) {
                          return 'Masukan kategori barang';
                        }
                        return '';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _jenis,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.white) //<-- SEE HERE
                            ),
                        prefixIcon: Icon(
                          Icons.access_alarms,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        hintText: 'Jenis barang',
                        hintStyle: TextStyle(color: Colors.white),
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.white),
                        // ),
                      ),
                      validator: (value) {
                        if (value?.length == null) {
                          return 'Masukan kategori barang';
                        }
                        return '';
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(30),
                          child: MaterialButton(
                            // minWidth: 100,
                            color: Color.fromARGB(
                                255, 139, 187, 17), // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Simpan Data',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
