import 'package:flutter/material.dart';

import 'package:penitipan/components/Navigate.dart';
import 'package:penitipan/components/NavigateUser.dart';
import 'package:penitipan/pages/dashboard.dart';
import 'package:penitipan/pages/dashboardUser.dart';
import 'package:penitipan/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Middleware {
  static Future<dynamic> getParams(String? params) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String prefdata = pref.getString("${params}").toString();
    return prefdata;
  }

  static Future<String> accesslogin(String param) async {
    SharedPreferences getval = await SharedPreferences.getInstance();
    String value = getval.getString(param).toString();
    return value;
  }

  static dynamic checklogin(String? levelid) {
    // print(levelid != null);
    if (levelid == true) {
      if (levelid == "1") {
        return Navigate();
      } else if (levelid == "2") {
        return NavigateUser();
      } else {
        return Login();
      }
    } else {
      return Login();
    }
  }

  static Future<String?> logout() async {
    SharedPreferences getval = await SharedPreferences.getInstance();
    getval.remove("token").toString();
    getval.remove("level").toString();
    getval.remove("id").toString();
  }

  // static void _submitForm(context,
  // _usernameController,
  // _passwordController,
  // form
  // ) async {
  //   checkCon();
  //   if (_formKey.currentState!.validate()) {
  //     List<String> printdata = [
  //       _usernameController.text,
  //       _passwordController.text,
  //     ];
  //     var url = Uri.parse(API_URL + '/login');
  //     var response = await http.post(url, body: {
  //       'username': _usernameController.text,
  //       'password': _passwordController.text,
  //     });
  //     print('${response.body}');
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> data = json.decode(response.body);
  //       String token = data['token'];
  //       String levelid = data['level'].toString();
  //       String username = data['username'].toString();
  //       // print(levelid);
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString('storage', token);
  //       prefs.setString('level', levelid);
  //       prefs.setString("username", username);
  //       if (levelid == "1") {
  //         Route route =
  //             MaterialPageRoute(builder: (context) => const Navigate());
  //         Navigator.push(context, route);
  //       } else {
  //         Route route =
  //             MaterialPageRoute(builder: (context) => const NavigateUser());
  //         Navigator.push(context, route);
  //       }
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Login berhasil'),
  //           // duration: Duration(seconds: 2),
  //         ),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Username Dan password Salah'),
  //           // duration: Duration(seconds: 2),
  //         ),
  //       );
  //     }
  //   } else {
  //     print('Form validation failed.');
  //   }
  // }
}
