import 'package:flutter/material.dart';

import '../../service/service.dart';

class Returpinjam extends StatefulWidget {
  const Returpinjam({super.key});

  @override
  State<Returpinjam> createState() => _ReturpinjamState();
}

class _ReturpinjamState extends State<Returpinjam>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _nomortransaksiController = TextEditingController();

  bool loaded = false;
  final List<dynamic> data = [];

  void _search() {
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    final transactiondata = _nomortransaksiController.text;
    // final getDetail = Service.returnPinjam(transactiondata);
    // setState(() {
    //   // data = getDetail;
    // });
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                                  "Edit Password",
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
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                // key: _globalKey,
                                child:
                                    // TextEditingController(text: )
                                    Column(
                                  children: [
                                    TextFormField(
                                      enabled: false,
                                      // controller: _npwpdController,
                                      // disab
                                      decoration: InputDecoration(
                                        labelText: 'NPWPD',
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
                                          Icons.type_specimen_sharp,
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
                                        hintText: 'NPWPD / Username',
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
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      // controller: _passwordController,
                                      obscureText: true,
                                      //
                                      decoration: InputDecoration(
                                        labelText: 'Password',
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
                                          Icons.type_specimen_sharp,
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
                                        hintText: 'Password',
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
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      // controller: _konfirmasiPassword,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
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
                                          Icons.type_specimen_sharp,
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
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
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
                                            onPressed: () => null,
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
}
