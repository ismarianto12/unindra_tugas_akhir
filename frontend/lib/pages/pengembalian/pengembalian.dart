import 'package:flutter/material.dart';

import '../../components/Navigate.dart';

class Pegembalian extends StatefulWidget {
  const Pegembalian({super.key});

  @override
  State<Pegembalian> createState() => _PegembalianState();
}

class _PegembalianState extends State<Pegembalian> {
  bool loaded = false;
  final _formKey = GlobalKey<FormState>();
  final _cariController = TextEditingController();

  void _cariData() {
    setState(() {
      loaded = true;
    });
  }

  void _cancel() {
    _cariController.text = "";
    setState(() {
      loaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Route route =
                MaterialPageRoute(builder: (context) => const Navigate());
            Navigator.push(context, route);
          },
          child: Icon(Icons.home)),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset('assets/images/return.png'),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        TextFormField(
                          // enabled: false,
                          controller: _cariController,
                          decoration: InputDecoration(
                            labelText: 'Masukan Nomor Transaksi',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Nomor transaksi Wajib";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.0),
                      ]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 170,
                        height: 40,
                        child: MaterialButton(
                          // height: 10.0,
                          color: Color.fromARGB(
                              255, 15, 7, 164), // Background color
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(100),
                          // ),
                          onPressed: _cariData,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.save,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Cari Data',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 160,
                        height: 40,
                        child: MaterialButton(
                          // height: 10.0,
                          color: Color.fromARGB(
                              255, 164, 78, 7), // Background color
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(100),
                          // ),
                          onPressed: _cancel,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.save,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          if (!loaded)
            Text("Silahkan Masukan Nomor Transaksi")
          else
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Table(
                    border: TableBorder.all(color: Colors.black26),
                    // columnWidths: {
                    //   0: FixedColumnWidth(
                    //       100), // Set width of column 0 to 100 pixels
                    //   1: FlexColumnWidth(
                    //       1), // Set width of column 1 to expand to remaining space
                    //   2: FixedColumnWidth(
                    //       200), // Set width of column 2 to 200 pixels
                    // },
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Nama Barang"),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Nama Barang"),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Nama Barang"),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Nama Barang"),
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
              ),
            )
        ],
      )),
    );
  }
}
