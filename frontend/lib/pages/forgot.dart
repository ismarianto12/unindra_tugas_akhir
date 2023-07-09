import 'package:penitipan/pages/login.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: SafeArea(
          child: Center(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.supervised_user_circle_sharp,
                size: 150,
                color: Colors.white,
              ),
              Text(
                'Lupa Akses Account',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
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
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Colors.white) //<-- SEE HERE
                                  ),
                              prefixIcon: Icon(
                                Icons.supervised_user_circle_sharp,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Color.fromARGB(255, 255, 255, 255)),
                              // ),
                              filled: true,
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (value) {
                              // if (value.isEmpty) {
                              //   return 'Please enter your email';
                              // }
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
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'Forgot',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 26),
                        InkWell(
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => Login());
                            Navigator.push(context, route);
                          },
                          child: Text(
                            'Back Home',
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
}
