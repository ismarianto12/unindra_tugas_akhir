import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penitipan/components/CameraCaptureScreen.dart';
import 'package:penitipan/components/NavigateUser.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:penitipan/pages/penitipan/penitipanList.dart';
import 'package:penitipan/service/middleware.dart';
import '../../env.dart';
import 'dart:convert';

class FormBayarPen extends StatefulWidget {
  final Map<String, dynamic> databayar;

  FormBayarPen({required this.databayar});

  @override
  State<FormBayarPen> createState() => _FormBayarPenState();
}

class _FormBayarPenState extends State<FormBayarPen> {
  final _formkey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  final _kodeTransaksiController = TextEditingController();
  final _namaBarangController = TextEditingController();
  final _biayaPenitipanController = TextEditingController();
  final _tanggalPengembalian = TextEditingController();
  final _jumlahbayar = TextEditingController();

  final FocusNode _textFocus = FocusNode();
  String selectedImagePath = '';
  bool _loading = true;

  void _sumbitform() async {
    String username = await Middleware.getParams("username");
    String user_id = await Middleware.getParams("userid");
    if (_formkey.currentState!.validate()) {
      if (selectedImagePath == '') {
        final snackBar = SnackBar(
          content: const Text('Silahkan Pilih file bukti bayar'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (_jumlahbayar.text != widget.databayar['biayaPenitipan']) {
        final snackBar = SnackBar(
          content: const Text('Silahkan masukan nominal yang sesuai'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        var apiUrl = API_URL + '/user_konfirm/pengembalian';

        var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

        request.fields['jenis'] = "penitipan";
        request.fields['total'] = widget.databayar['biayaPenitipan'];
        request.fields['jumlahbayar'] = _jumlahbayar.text;
        request.fields['user_id'] = user_id;
        request.fields['id_penitipan'] = widget.databayar['id'].toString();

        if (selectedImagePath != null) {
          request.files.add(await http.MultipartFile.fromPath(
              'buktibayar', selectedImagePath!));
        } else {
          _hideLoadingDialog();
          setState(() {
            _loading = false;
          });
        }
        final response = await request.send();
        String responseBody =
            await response.stream.transform(utf8.decoder).join();
        print("response ${responseBody}");

        final snackBar = SnackBar(
          content: Text(responseBody),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        if (response.statusCode == 200) {
          final snackBar = SnackBar(
            content: const Text('Data Data Pad Berhasil di laporkan'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Route route =
              MaterialPageRoute(builder: (context) => PenitipanList());
          Navigator.push(context, route);
        } else {
          setState(() {
            _loading = false;
          });
          SnackBar(
            content: const Text('Gagal menyimpan data'),
          );
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _kodeTransaksiController.text = widget.databayar['namaBarang'];
    _namaBarangController.text = widget.databayar['namaBarang'];
    _biayaPenitipanController.text = widget.databayar['biayaPenitipan'];
    _tanggalPengembalian.text = widget.databayar['biayaPenitipan'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 10, 56, 208),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/premium-vector/smartphone-ui-ux-design-concept-application_73903-155.jpg"),
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Bayar Penitipan",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.16),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 100,
                      height: MediaQuery.of(context).size.height - 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                key: _formkey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      enabled: false,
                                      controller: _kodeTransaksiController,
                                      decoration: InputDecoration(
                                        labelText: 'Kode Transaksi',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: const Color.fromARGB(
                                              255,
                                              140,
                                              139,
                                              139,
                                            ),
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.account_balance_wallet_outlined,
                                          color: const Color.fromARGB(
                                            255,
                                            140,
                                            139,
                                            139,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                              255,
                                              140,
                                              139,
                                              139,
                                            ),
                                          ),
                                        ),
                                        fillColor: const Color.fromARGB(
                                          255,
                                          140,
                                          139,
                                          139,
                                        ),
                                        hintText: 'Nama Barang',
                                        hintStyle: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            140,
                                            139,
                                            139,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Silahkan masukan jumlah bayar';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      controller: _biayaPenitipanController,
                                      decoration: InputDecoration(
                                        labelText: 'Harga',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: const Color.fromARGB(
                                              255,
                                              140,
                                              139,
                                              139,
                                            ),
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.monetization_on,
                                          color: const Color.fromARGB(
                                            255,
                                            140,
                                            139,
                                            139,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                              255,
                                              140,
                                              139,
                                              139,
                                            ),
                                          ),
                                        ),
                                        fillColor: const Color.fromARGB(
                                          255,
                                          140,
                                          139,
                                          139,
                                        ),
                                        hintText: 'Bayar',
                                        hintStyle: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            140,
                                            139,
                                            139,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Bayar';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      controller: _jumlahbayar,
                                      decoration: InputDecoration(
                                        labelText: 'Jumlah Bayar',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: const Color.fromARGB(
                                              255,
                                              140,
                                              139,
                                              139,
                                            ),
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.monitor_heart,
                                          color: const Color.fromARGB(
                                            255,
                                            140,
                                            139,
                                            139,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                              255,
                                              140,
                                              139,
                                              139,
                                            ),
                                          ),
                                        ),
                                        fillColor: const Color.fromARGB(
                                          255,
                                          140,
                                          139,
                                          139,
                                        ),
                                        hintText: 'Konfirmasi Password',
                                        hintStyle: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            140,
                                            139,
                                            139,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Silahkan masukan jumlah bayar .';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.99,
                                      height: 35,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20.0), // Adjust the radius as needed
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateColor.resolveWith(
                                            (states) {
                                              if (states.contains(
                                                  MaterialState.pressed)) {
                                                return Colors
                                                    .red; // Color when the button is pressed.
                                              }
                                              return Color.fromARGB(
                                                  255,
                                                  20,
                                                  215,
                                                  88); // Default color for the button.
                                            },
                                          ),
                                        ),
                                        onPressed: () => selectImage(),
                                        child: Text('Upload File',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    selectedImagePath == ''
                                        ? Text("")
                                        : Image.file(
                                            File(selectedImagePath),
                                            height: 200,
                                            width: 200,
                                            fit: BoxFit.fill,
                                          ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(height: 35),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.99,
                                          height: 35,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0), // Adjust the radius as needed
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateColor
                                                      .resolveWith(
                                                (states) {
                                                  if (states.contains(
                                                      MaterialState.pressed)) {
                                                    return Colors
                                                        .red; // Color when the button is pressed.
                                                  }
                                                  return Color.fromARGB(
                                                      255,
                                                      20,
                                                      215,
                                                      88); // Default color for the button.
                                                },
                                              ),
                                            ),
                                            onPressed: () => _sumbitform(),
                                            child: Text('Simpan',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 35,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.99,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20),
                                                    ), // Adjust the radius as needed
                                                  ),
                                                ),
                                                backgroundColor:
                                                    MaterialStateColor
                                                        .resolveWith(
                                                  (states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .pressed)) {
                                                      return Colors
                                                          .red; // Color when the button is pressed.
                                                    }
                                                    return Colors
                                                        .blue; // Default color for the button.
                                                  },
                                                ),
                                              ),
                                              onPressed: () => null,
                                              child: Text('Batal',
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Pilih Aksi',
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();
                            print('Image_Path:-');
                            print(selectedImagePath);
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();
                            print('Image_Path:-');
                            print(selectedImagePath);

                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text("Save data..."),
            ],
          ),
        );
      },
    );
  }

  void _hideLoadingDialog() {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
