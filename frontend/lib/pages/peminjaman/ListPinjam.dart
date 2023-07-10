import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../env.dart';
import 'dart:convert';

class ListPinjam extends StatefulWidget {
  const ListPinjam({super.key});

  @override
  State<ListPinjam> createState() => _ListPinjamState();
}

class _ListPinjamState extends State<ListPinjam> {
  List<dynamic> data = [];

  Future<void> Calldata() async {
    final response = await http.get(Uri.parse(API_URL + '/listpinjam'),
        headers: {"Headers": 'Applications/json'});

    try {
      if (response.statusCode == 200) {
        setState(() {
          data = json.decode(response.body);
        });
      }
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    Calldata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Peminjamaman Barang')),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: null,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Colors.black12) //<-- SEE HERE
                    ),
                prefixIcon: Icon(
                  Icons.verified_user_sharp,
                  color: Colors.black12,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                ),
                fillColor: Colors.black12,
                hintText: 'Cari ....',
                hintStyle: TextStyle(color: Colors.black12),
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.black12),
                // ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Silahkan Masukan data';
                }
                return null;
              },
            ),
          ),
          data.isEmpty
              ? Column(
                  children: [
                    Text('Loading data..'),
                    CircularProgressIndicator(),
                  ],
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: data[index]['namapeminjama'],
                      ),
                    );
                  }),
        ],
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    data;
  }
}
