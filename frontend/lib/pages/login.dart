import 'package:penitipan/components/Navigate.dart';
import 'package:penitipan/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'forgot.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              Image.network(
                "https://cdn-icons-png.flaticon.com/512/3031/3031702.png",
                height: 100,
                width: 100,
              ),
              SizedBox(height: 10),
              Text(
                'Welcome Page',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(height: 10),
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
                              // if (value.isEmpty) {
                              //   return 'Please enter your password';
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
                                  onPressed: () {
                                    Route route = MaterialPageRoute(
                                        builder: (context) => Navigate());
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
                        SizedBox(height: 26),
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
}
