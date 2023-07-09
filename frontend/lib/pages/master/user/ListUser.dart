import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:penitipan/env.dart';
import 'package:penitipan/pages/master/form_add.dart';

class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse(API_URL + '/masterdata/satuan/satuan'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 8, 200, 18),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Route route = MaterialPageRoute(
            builder: (context) => FormAdd(),
          );
          Navigator.push(context, route);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text(
          'List Data Master',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    columns: const <DataColumn>[
                      DataColumn(
                          label: Text(
                        'No.',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataColumn(
                          label: Text(
                        'Kode',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataColumn(
                          label: Text(
                        'Nama',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataColumn(
                          label: Text(
                        'Tipe',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataColumn(
                          label: Text(
                        'Action',
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                    rows: List<DataRow>.generate(
                      data.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text(data[index]['id'].toString())),
                          DataCell(Text(data[index]['kode'] ?? 'N/A')),
                          DataCell(Text(data[index]['nama'] ?? 'N/A')),
                          DataCell(Text(data[index]['type'] ?? 'N/A')),
                          DataCell(Row(
                            children: [
                              IconButton(
                                color: Colors.green,
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                color: Colors.red,
                                icon: Icon(Icons.delete),
                                onPressed: () {},
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                Text('Geser Ke Kiri melihat data')
              ],
            ),
    );
  }
}
