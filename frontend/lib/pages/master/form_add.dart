import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:penitipan/components/Navigate.dart';
import 'package:penitipan/pages/master/ListMaster.dart';
import 'package:penitipan/pages/master/master.dart';

import '../../env.dart';

class FormAdd extends StatefulWidget {
  @override
  _FormAddState createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  TextEditingController _kodeController = TextEditingController();
  TextEditingController _namaMasterController = TextEditingController();
  String? _activeValue;
  List<String> _activeOptions = ['Publish', 'Draft'];

  bool _validateInputs() {
    if (_kodeController.text.isEmpty ||
        _namaMasterController.text.isEmpty ||
        _activeValue == null) {
      return false;
    }
    return true;
  }

  void _submitForm() async {
    if (_validateInputs()) {
      List<String> printdata = [
        _kodeController.text,
        _namaMasterController.text,
      ];
      var url = Uri.parse(API_URL + '/masterdata/satuan/insert');
      var response = await http.post(url, body: {
        'kode': _kodeController.text,
        'nama': _namaMasterController.text,
        'type': 'satuan',
      });
      if (response.statusCode == 200) {
        _showConfirmationDialog();
      } else {
        print('${response.body}');
      }
    } else {
      print('Form validation failed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => Navigate());
          Navigator.push(context, route);
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Master Data Satuan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.50,
                        color:
                            const Color.fromARGB(255, 0, 0, 0)) //<-- SEE HERE
                    ),
                prefixIcon: Icon(
                  Icons.access_alarms,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.white,
                hintText: 'Kode',
                hintStyle: TextStyle(color: Colors.white),
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.white),
                // ),
              ),
              controller: _kodeController,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _namaMasterController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.50,
                        color:
                            const Color.fromARGB(255, 0, 0, 0)) //<-- SEE HERE
                    ),
                prefixIcon: Icon(
                  Icons.keyboard,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.white,
                hintText: 'Nama ',
                hintStyle: TextStyle(color: Colors.white),
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.white),
                // ),
              ),
            ),
            SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _activeValue,
              items: _activeOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _activeValue = newValue;
                });
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.50,
                        color:
                            const Color.fromARGB(255, 0, 0, 0)) //<-- SEE HERE
                    ),
                prefixIcon: Icon(
                  Icons.keyboard,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.white,
                hintText: 'Status',
                labelText: 'Status',
                hintStyle: TextStyle(color: Colors.white),
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.white),
                // ),
              ),
            ),
            SizedBox(height: 36.0),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    // minWidth: 100,
                    color:
                        Color.fromARGB(255, 139, 187, 17), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: _submitForm,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(Icons.save, color: Colors.white),
                          Text(
                            'Simpan',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    // minWidth: 100,
                    color: Color.fromARGB(255, 212, 12, 12), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: _submitForm,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
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
                Text(
                    'Data berhasil di tambah apakah anda ingin menambahkan yang lain ? '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                // Tambahkan kode untuk menghapus data di sini
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => ListMaster());
                Navigator.push(context, route);
              },
            ),
          ],
        );
      },
    );
  }
}
