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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _cariController = TextEditingController();

  final String nomorTelepon = '';
  final String alamat = '';
  final String namaBarang = '';
  final String deskripsiBarang = '';
  final String tanggalPenitipan = '';
  final String durasiPenitipan = '';
  final String biayaPenitipan = '';
  final String instruksiKhusus = '';

  void _cariData() {
    setState(() {
      loaded = true;
    });
    FocusManager.instance.primaryFocus?.unfocus();
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
      key: _scaffoldKey,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset('assets/images/return.png'),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Card(
                  color: Color.fromARGB(255, 255, 255, 255),
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
                            width: 140,
                            height: 40,
                            child: MaterialButton(
                              // height: 10.0,
                              color: Color.fromARGB(
                                  255, 15, 7, 164), // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _cariData();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.save,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10.0),
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
                            width: 140,
                            height: 40,
                            child: MaterialButton(
                              // height: 10.0,
                              color: Color.fromARGB(
                                  255, 164, 78, 7), // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
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
                                    SizedBox(width: 10.0),
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
            ),
            SizedBox(
              height: 12,
            ),
            if (!loaded)
              Text("Silahkan Masukan Nomor Transaksi")
            else
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/checked.png",
                          width: 20,
                          height: 20,
                        ),
                        Text("No Transaksi Pengembalian : " +
                            _cariController.text),
                      ],
                    ),
                    Card(
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Table(
                          // border: TableBorder.all(),
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Kode Transaksi'),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Cell 1-2'),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Nama Barang'),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Cell 1-4'),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Tanggal Pinjam'),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Cell 2-2'),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Harga'),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Cell 2-4'),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Catatan'),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Cell 3-2'),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Tgl Kembali'),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Cell 3-4'),
                                  ),
                                ),
                              ],
                            ),
                            // TableRow(
                            //   children: [
                            //     TableCell(
                            //       child: Container(
                            //         padding: EdgeInsets.all(8.0),
                            //         child: Text('Diterima'),
                            //       ),
                            //     ),
                            //     TableCell(
                            //       child: Container(
                            //         padding: EdgeInsets.all(8.0),
                            //         child: Text('Cell 4-2'),
                            //       ),
                            //     ),
                            //     // TableCell(
                            //     //   child: Container(
                            //     //     padding: EdgeInsets.all(8.0),
                            //     //     child: Text(''),
                            //     //   ),
                            //     // ),
                            //     // TableCell(
                            //     //   child: Container(
                            //     //     padding: EdgeInsets.all(8.0),
                            //     //     child: Text('Cell 4-4'),
                            //     //   ),
                            //     // ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                    MaterialButton(
                      // height: 10.0,
                      color:
                          Color.fromARGB(255, 201, 10, 153), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      onPressed: _cancel,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.money,
                              color: Colors.white,
                            ),
                            Text(
                              'Bayar Penitipan',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      )),
    );
  }
}
