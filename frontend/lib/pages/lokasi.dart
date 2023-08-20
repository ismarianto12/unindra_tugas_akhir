import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class Lokasi extends StatefulWidget {
  const Lokasi({super.key});

  @override
  State<Lokasi> createState() => _LokasiState();
}

class _LokasiState extends State<Lokasi> {
  final _konfirmasiPassword = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _npwpdController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  void _submitForm() async {
    if (_globalKey.currentState!.validate()) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String getlisusername = pref.getString('username').toString();

      if (_konfirmasiPassword.text != _passwordController.text) {
        //create data
        final snackBar = SnackBar(
          content: Text('Silahkan Cek Password Tidak sama'),
          duration: Duration(
              seconds:
                  3), // Optional: Control how long the Snackbar will be displayed
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Do something when the user clicks the action button (e.g., undo)
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        var url = Uri.parse("/Lokasi");
        final response = await http.post(url, body: {
          'userid': getlisusername
        }, headers: {
          "Content-Type": "application/json",
        });
        // print("response : ${response}");
        if (response.statusCode == 200) {
        } else {
          // Material
          final snackBar = SnackBar(
            content: Text('Gagal'),
            duration: Duration(
                seconds:
                    3), // Optional: Control how long the Snackbar will be displayed
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                // Do something when the user clicks the action button (e.g., undo)
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }
  }

  String getusername = '';
  String getpajakname = '';
  Future<String?> _username() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String getlisusername = pref.getString('username').toString();
    String getpajakname = pref.getString('pajakname').toString();

    _npwpdController.text = getlisusername;

    setState(() {
      getusername = getlisusername;
      getpajakname = getpajakname;
    });
  }

  @override
  void initState() {
    super.initState();
    _username();
  }

  _cancel() {
    _konfirmasiPassword.text = '';
    _passwordController.text = '';
    _emailController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    // width: double.infinity,
                    // height: double.infinity,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lokasi CV KAZAR INDONESIA",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 38.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Alamat:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'vOffice East, Jl. Perserikatan No.1, RT.2/RW.8, Rawamangun, Kec. Pulo Gadung, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13220',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Hours:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Closed ⋅ Opens 8 AM Mon',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Telepon:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '0813-8147-5767',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Provinsi:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Jakarta',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Sarankan edit · Pemilik bisnis ini?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
}
