import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:penitipan/components/excertile.dart';
import 'dart:convert';

import '../../env.dart';

class PenitipanList extends StatefulWidget {
  @override
  _PenitipanListState createState() => _PenitipanListState();
}

class _PenitipanListState extends State<PenitipanList> {
  List<dynamic> dataPenitipan = [];
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
    var url = Uri.parse(API_URL + '/pengembalian/penitipan');
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

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 237, 237),
      appBar: AppBar(
        title: const Text('Daftar Penitipan Barang'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: Colors.white) //<-- SEE HERE
                    ),
                prefixIcon: Icon(
                  Icons.access_alarms,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                fillColor: const Color.fromARGB(255, 0, 0, 0),
                hintText: 'Cari ...',
                hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.white),
                // ),
              ),
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataPenitipan.length,
              itemBuilder: (context, index) {
                // print(dataPenitipan[index]?['return'] == "1");

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
                                color: dataPenitipan[index]?['return'] == "1"
                                    ? Colors.green
                                    : Colors.orange,
                                child: Icon(
                                  size: 18.0,
                                  Icons.money_rounded,
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
                                Text(dataPenitipan[index]?['namaBarang'] ??
                                    'Undefined'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(dataPenitipan[index]?['biayaPenitipan'] ??
                                    'Undefined'),
                                dataPenitipan[index]?['return'] == "1"
                                    ? Icon(Icons.verified)
                                    : Text("")
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: () {
                              _showConfirmationDialog(dataPenitipan[index]);
                            },
                            child: dataPenitipan[index]?['return'] == "1"
                                ? Icon(
                                    Icons.verified,
                                    color: Colors.grey,
                                    size: 30.0,
                                  )
                                : Icon(
                                    Icons.pending_actions,
                                    color: Colors.grey,
                                    size: 30.0,
                                  )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

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
