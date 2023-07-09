import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    final response =
        await http.get(Uri.parse(API_URL + '/masterdata/satuan/satuan'));
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

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    borderSide: BorderSide(
                        width: 1,
                        color:
                            const Color.fromARGB(255, 0, 0, 0)) //<-- SEE HERE
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
                return Card(
                  child: ListTile(
                    title: Text(
                        dataPenitipan[index]?['nama_penitip'] ?? 'Undefined'),
                    subtitle: Text(
                        dataPenitipan[index]?['nama_barang'] ?? 'Undefined'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Aksi untuk tombol edit
                            // Tambahkan kode untuk membuka form edit
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.payment),
                          onPressed: () {
                            // Aksi untuk tombol konfirmasi bayar
                            // Tambahkan kode untuk melakukan konfirmasi pembayaran
                          },
                        ),
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
}
