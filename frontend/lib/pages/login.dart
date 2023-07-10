import 'dart:math';

import 'package:penitipan/components/Navigate.dart';
import 'package:penitipan/env.dart';
import 'package:penitipan/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'forgot.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _validateInputs() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void _submitForm() async {
    Route route = MaterialPageRoute(builder: (context) => const Navigate());
    Navigator.push(context, route);

    if (_validateInputs()) {
      List<String> printdata = [
        _usernameController.text,
        _passwordController.text,
      ];
      var url = Uri.parse(API_URL + '/login');
      var response = await http.post(url, body: {
        'username': _usernameController.text,
        'password': _passwordController.text,
      });
      print('${response.body}');
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('storage', response.body);
        Route route = MaterialPageRoute(builder: (context) => const Navigate());
        Navigator.push(context, route);
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
      backgroundColor: Color.fromARGB(255, 3, 95, 170),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 3, 95, 170),
              Color.fromARGB(255, 20, 6, 75)
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              // AssetImage("assets/images/login.jpeg"),
              Image.asset(
                "assets/images/login_app.png",
                height: 150,
                width: 150,
              ),

              SizedBox(height: 10),
              const Text(
                'Aplikasi Pentipan dan peminjaman barang',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(height: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: _usernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Colors.white) //<-- SEE HERE
                                  ),
                              prefixIcon: Icon(
                                Icons.verified_user_sharp,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.white,
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.white),
                              // border: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.white),
                              // ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Colors.white) //<-- SEE HERE
                                  ),
                              prefixIcon: Icon(
                                Icons.access_alarms,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.white,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white),
                              // border: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.white),
                              // ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(30),
                                child: MaterialButton(
                                  // minWidth: 100,
                                  color: Color.fromARGB(
                                      255, 139, 187, 17), // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  onPressed: () {
                                    Route route = MaterialPageRoute(
                                        builder: (context) => const Navigate());
                                    Navigator.push(context, route);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 126),
                        InkWell(
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => Forgot());
                            Navigator.push(context, route);
                          },
                          child: Text(
                            'Forget Passowrd ?',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    _usernameController.text;
    _passwordController.text;
    super.dispose();
  }
}
