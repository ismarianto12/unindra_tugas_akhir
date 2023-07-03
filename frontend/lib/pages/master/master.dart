import 'package:flutter/material.dart';

import 'form_add.dart';

class Master extends StatefulWidget {
  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  List<DataRow> _dataRows = [];

  @override
  void initState() {
    super.initState();
    // Menginisialisasi data awal
    _dataRows = _generateDataRows();
  }

  List<DataRow> _generateDataRows() {
    List<DataRow> dataRows = [];
    // Data dummy
    List<Map<String, dynamic>> dummyData = [
      {"name": "John Doe", "age": 25},
      {"name": "Jane Smith", "age": 30},
      {"name": "Alice Johnson", "age": 35},
    ];

    void _confirmDelete(Map<String, dynamic> data) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            icon: const Icon(Icons.question_answer),
            title: Text('Konfirmasi Hapus'),
            content: Text('Anda yakin ingin menghapus ${data['name']}?'),
            actions: <Widget>[
              TextButton(
                child: Text('Batal'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Hapus',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  setState(() {
                    dummyData.remove(data);
                    _dataRows = _generateDataRows();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    // Membuat DataRow dari data dummy
    for (var i = 0; i < dummyData.length; i++) {
      var data = dummyData[i];
      DataRow row = DataRow(
        cells: [
          DataCell(Text((i + 1).toString())), // Kolom urutan
          DataCell(Text(data['name'])),
          DataCell(Text(data['age'].toString())),
          DataCell(
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Tambahkan logika edit di sini
                print('Edit: ${data['name']}');
              },
            ),
          ),
          DataCell(
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                // Tambahkan logika hapus di sini
                // setState(() {
                //   dummyData.remove(data);
                //   _dataRows = _generateDataRows();
                // });
                _confirmDelete(data);
              },
            ),
          ),
        ],
      );
      dataRows.add(row);
    }

    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => FormAdd());
          Navigator.push(context, route);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Master Satuan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('#')),
                    DataColumn(label: Text('Satuan')),
                    DataColumn(label: Text('Ket')),
                    DataColumn(label: Text('Edit')),
                    DataColumn(label: Text('Delete')),
                  ],
                  rows: _dataRows,
                ),
              ),
              const Expanded(
                child: Text(
                  'Silahkan Scroll ke samping untuk melihat data',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
