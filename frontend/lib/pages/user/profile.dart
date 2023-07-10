import 'package:flutter/material.dart';

import '../../service/service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formkey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ulangpasswordController = TextEditingController();

  final _nameController = TextEditingController();
  List<dynamic> data = [];

  void _simpanData() {}

  @override
  void initState() {
    super.initState();
    final res = Service.getProfile('test');
    print(res);
    setState(() {
      // final data = response;

      // print(data);
      _usernameController.text = "TEST";
      _emailController.text = "TEST";
      _passwordController.text = "TEST";
      _nameController.text = "TEST";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 2),
                Text(
                  'Edit Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  'assets/images/profile.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama penitip harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email Harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nama User',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama user harus diisi .';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama penitip harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _ulangpasswordController,
                  decoration: InputDecoration(
                    labelText: 'Ulangi Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ulangi password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: MaterialButton(
                    // height: 10.0,
                    color: Color.fromARGB(255, 15, 7, 164), // Background color
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
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: MaterialButton(
                    color: Color.fromARGB(255, 227, 179, 5), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.restore,
                            color: Colors.white,
                          ),
                          Text(
                            'Batal',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.text;
    _emailController.text;
    _passwordController.text;
    _nameController.text;
  }
}
