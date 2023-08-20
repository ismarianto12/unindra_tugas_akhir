import 'package:flutter/material.dart';
import 'package:penitipan/pages/listdata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class TataCara extends StatefulWidget {
  const TataCara({super.key});

  @override
  State<TataCara> createState() => _TataCaraState();
}

class _TataCaraState extends State<TataCara> {
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
        var url = Uri.parse("/TataCara");
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

  final List<String> steps = [
    'User akan melihat menu login dan menuju ke sistem yang menampilkannya',
    'User melakukan login pada aplikasi',
    'User mengunjungi menu pada pilihan di menu tampilan aplikasi',
    'User mengisi formulir',
    'Sistem mengarahkan user pada menu pembayaran',
    'Sistem mengarahkan user pada tampilan menu utama jika user berhasil transaksi',
    'Sistem mengeluarkan user jika transaksi gagal',
  ];

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Tatacara Cara Penggunaan Aplikasi",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ],
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
                      child: Listdata(),
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

  Widget Listdata() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
          ),
          title: Text(steps[index]),
        );
      },
    );
  }
}
