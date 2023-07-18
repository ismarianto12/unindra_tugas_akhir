import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../components/Datepicker.dart';
import '../../env.dart';

class PenitipanBarangForm extends StatefulWidget {
  @override
  _PenitipanBarangFormState createState() => _PenitipanBarangFormState();
}

class _PenitipanBarangFormState extends State<PenitipanBarangForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  TextEditingController _namaController = TextEditingController();
  TextEditingController _nomorTeleponController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _namaBarangController = TextEditingController();
  TextEditingController _deskripsiBarangController = TextEditingController();
  TextEditingController _tanggalPenitipanController = TextEditingController();
  TextEditingController _durasiPenitipanController = TextEditingController();
  TextEditingController _biayaPenitipanController = TextEditingController();
  TextEditingController _instruksiKhususController = TextEditingController();

  String? _validateAlamat(String? value) {
    if (value == '') {
      return "Data alamat tidak boleh kosong";
    } else {
      return "";
    }
  }

  void _hitungBiayaPenitipan() {
    DateTime tglHariIni = DateTime.now();
    String formattedDate = _tanggalPenitipanController.text;
    DateTime tglPengembalian = DateTime(
      int.parse(formattedDate.substring(6)), // Year
      int.parse(formattedDate.substring(3, 5)), // Month
      int.parse(formattedDate.substring(0, 2)), // Day
    );
    Duration durasiPenitipan = tglPengembalian.difference(tglHariIni);
    int totalHari = durasiPenitipan.inDays + 1;
    int biayaPenitipan = totalHari * 10000;

    _durasiPenitipanController.text = totalHari.toString() + ' Hari';
    _biayaPenitipanController.text = biayaPenitipan.toString();
  }

  void _simpanData() async {
    if (_formKey.currentState!.validate()) {
      var url = Uri.parse(API_URL + '/penitipan/simpan');
      var response = await http.post(url, body: {
        'nama': _namaController.text,
        'nomorTelepon': _nomorTeleponController.text,
        'alamat': _alamatController.text,
        'namaBarang': _namaBarangController.text,
        'deskripsiBarang': _deskripsiBarangController.text,
        'tanggalPenitipan': _tanggalPenitipanController.text,
        'durasiPenitipan': _durasiPenitipanController.text,
        'biayaPenitipan': _biayaPenitipanController.text,
        'instruksiKhusus': _instruksiKhususController.text,
      });
      print(response.body);
      if (response.statusCode == 200) {
        SnackBar(
          content: Text('Data berhasil disimpan'),
        );
        Navigator.pushNamed(context, '/penitipanlist');
      } else {
        SnackBar(
          content: Text('Gagal menyimpan data'),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              color: Color.fromARGB(255, 139, 187, 17), // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: _simpanData,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    Text(
                      'Simpan',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              color: Color.fromARGB(255, 227, 179, 5), // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.restore,
                      color: Colors.white,
                    ),
                    Text(
                      'Batal',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Form Penitipan Barang'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Tambah Penitipan Barang'),
              Image.asset(
                "assets/images/penitipan_image.png",
                height: 200,
                width: 200,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _namaController,
                        decoration: InputDecoration(
                          labelText: 'Nama Penitip',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama penitip harus diisi';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _nomorTeleponController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Nomor Telepon Penitip',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nomor telepon penitip harus diisi';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextField(
                        maxLines: 4,
                        controller: _alamatController,
                        decoration: InputDecoration(
                          errorText: _validateAlamat(_alamatController.text),
                          labelText: 'Alamat Penitip',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _namaBarangController,
                        decoration: InputDecoration(
                          labelText: 'Nama Barang',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama barang harus diisi';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _deskripsiBarangController,
                        decoration: InputDecoration(
                          labelText: 'Deskripsi Barang',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      Datepicker(
                        controller: _tanggalPenitipanController,
                        onDateSelected: (DateTime selectedDate) {
                          _hitungBiayaPenitipan();
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        enabled: false,
                        controller: _durasiPenitipanController,
                        decoration: InputDecoration(
                          labelText: 'Durasi Penitipan',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        enabled: false,
                        controller: _biayaPenitipanController,
                        decoration: InputDecoration(
                          labelText: 'Biaya Penitipan',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                      ),
                      Text('Untuk biaya penitipan per hari adalah 10.0000'),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _instruksiKhususController,
                        decoration: InputDecoration(
                          labelText: 'Instruksi Khusus',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
