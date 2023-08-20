import 'package:flutter/material.dart';
import 'package:penitipan/pages/login.dart';

import '../service/service.dart';

class Daftar extends StatefulWidget {
  const Daftar({super.key});

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  final _fomKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late BuildContext dialogContext;
//
  final _handphoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passworulangdController = TextEditingController();

  final token = '';
  bool _loading = false;
  void _simpanData() {
    if (_fomKey.currentState!.validate()) {
      if (_passwordController.text != _passworulangdController.text) {
        setState(() {
          _loading = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: const Text('Gagal Password tidak sama'),
          ),
        );
      } else {
        var response = Service.userDaftar(
            token,
            _emailController.text,
            _nameController.text,
            _usernameController.text,
            _passwordController.text,
            _passworulangdController.text);

        if (response != null) {
          _showLoadingDialog();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: const Text('Data berahasil di daftarkan Silahkan Login'),
            ),
          );
          Route route = MaterialPageRoute(builder: (context) => Login());
          Navigator.push(context, route);
        } else {}
      }
    } else {
      setState(() {
        _loading = false;
      });
      _hideLoadingDialog();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Silhkan isi semua form !!'),
          // duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black), // Set the icon color
        backgroundColor: Colors.white,
        title: Text(
          'Daftar ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/images/signup.jpeg",
              height: 200,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _fomKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email penitip harus diisi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _handphoneController,
                      decoration: InputDecoration(
                        labelText: 'No Handphone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email penitip harus diisi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email penitip harus diisi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nama',
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
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Pasword Wajib diisi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      // ke
                      obscureText: true,
                      controller: _passworulangdController,
                      decoration: InputDecoration(
                        labelText: 'Ulangi Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password Wajib diisi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: MaterialButton(
                        // height: 10.0,
                        color:
                            Color.fromARGB(255, 15, 7, 164), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        onPressed: _simpanData,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.save,
                                color: Colors.white,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Simpan',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: MaterialButton(
                        // height: 10.0,
                        color: Color.fromARGB(
                            255, 255, 255, 255), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        onPressed: _simpanData,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.refresh_rounded,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Batal',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
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
              Text("Loading..."),
            ],
          ),
        );
      },
    );
  }

  void _hideLoadingDialog() {
    if (Navigator.of(dialogContext, rootNavigator: true).canPop()) {
      Navigator.of(dialogContext, rootNavigator: true).pop();
    }
  }

  @override
  void dispose() {
    _usernameController.text;
    _nameController.text;
    _passwordController.text;
    super.dispose();
  }
}
