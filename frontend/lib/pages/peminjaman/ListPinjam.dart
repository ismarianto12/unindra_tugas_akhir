import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:penitipan/components/excertile.dart';
import 'package:penitipan/pages/dashboard.dart';
import 'dart:convert';

import '../../env.dart';

class ListPinjam extends StatefulWidget {
  @override
  _ListPinjamState createState() => _ListPinjamState();
}

class _ListPinjamState extends State<ListPinjam> {
  // Your existing code...
  List<dynamic> dataPenitipan = [];
  List<dynamic> filteredDataPenitipan = [];

  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(API_URL + '/penitipan/list'));
    print(response.body);
    if (response.statusCode == 200) {
      final responseBody = response.body;
      if (responseBody != null) {
        setState(() {
          dataPenitipan = json.decode(responseBody);
        });
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  void confirm(int data) async {
    var url = Uri.parse(API_URL + '/pengembalian/peminjaman');
    var response = await http.post(url, body: {
      'id': data.toString(),
    });
    print('${response.body}');
    if (response.statusCode == 200) {
      // Map<String, dynamic> data = json.decode(response.body);
      // String token = data['token'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dat Penitipan Berhasil'),
          duration: Duration(seconds: 2),
        ),
      );
      return fetchData();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data Gagal di konfirmasi'),
        ),
      );
    }
  }

  void updateFilteredDataPenitipan() {
    setState(() {
      print('hitung panjang');
      print(searchQuery.length);
      if (searchQuery.isNotEmpty) {
        filteredDataPenitipan = dataPenitipan
            .where((item) => item['namaBarang']
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
            .toList();
      } else {
        filteredDataPenitipan = dataPenitipan;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    setState(() {
      if (searchQuery.isNotEmpty) {
        filteredDataPenitipan = dataPenitipan
            .where((item) => item['namaBarang']
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
            .toList();
      } else {
        filteredDataPenitipan = dataPenitipan;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
            (route) => false,
          );
        },
        child: Icon(Icons.home),
      ),
      backgroundColor: Color.fromARGB(255, 237, 234, 234),
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            bottom: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // iconTheme: null,
              title: Container(
                width: MediaQuery.of(context).size.width * 100,
                height: 45,
                child: TextFormField(
                  // controller: _usernameController,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                      updateFilteredDataPenitipan();
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: const Color.fromARGB(
                                255, 112, 111, 111)) //<-- SEE HERE
                        ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 97, 96, 96),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    hintText: 'Cari No Transaksi',
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 184, 183, 183)),
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.white),
                    // ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),
            ),
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Lis tData Peminjaman',
                // textScaleFactor: 1,
                style: TextStyle(color: Colors.black),
              ),
              background: Image.network(
                'https://img.freepik.com/premium-vector/credit-card-debt-concept-frustrated-businessman-having-financial-problems-debts-loans_199064-942.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: EdgeInsets.all(16),
                                color: filteredDataPenitipan[index]
                                            ?['return'] ==
                                        "1"
                                    ? Colors.green
                                    : Colors.orange,
                                child: Icon(
                                  size: 18.0,
                                  Icons.view_list_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(filteredDataPenitipan[index]
                                        ?['namaBarang'] ??
                                    'Undefined'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(filteredDataPenitipan[index]
                                        ?['biayaPenitipan'] ??
                                    'Undefined'),
                              ],
                            ),
                          ],
                        ),
                        filteredDataPenitipan[index]?['return'] != "1"
                            ? InkWell(
                                onTap: () {
                                  _showConfirmationDialog(
                                      filteredDataPenitipan[index]);
                                },
                                child: filteredDataPenitipan[index]
                                            ?['return'] ==
                                        "1"
                                    ? Icon(
                                        Icons.verified,
                                        color: Colors.grey,
                                        size: 30.0,
                                      )
                                    : Icon(
                                        Icons.pending_actions,
                                        color: Colors.grey,
                                        size: 30.0,
                                      ))
                            : const Icon(
                                Icons.verified,
                                color: Colors.grey,
                                size: 30.0,
                              ),
                      ],
                    ),
                  ),
                );
              },
              childCount: filteredDataPenitipan.length,
            ),
          ),
        ],
      ),
    );
  }

  // Your existing methods...
  Future<void> _showConfirmationDialog(data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // dialog tidak bisa ditutup dengan menekan area di luar dialog
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: Text('Konfirmasi Pengembalian ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.asset(
                  "assets/images/penitipan_image.png",
                  height: 200,
                  width: 200,
                ),
                Text('Nama barang: ' + data['namaBarang']),
                Text('Biaya Penitipan: ' + data['biayaPenitipan']),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                Navigator.of(context).pop();
                return confirm(data['id']);
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
