import 'package:penitipan/components/Navigate.dart';
import 'package:penitipan/components/NavigateUser.dart';
import 'package:penitipan/pages/dashboard.dart';
import 'package:penitipan/pages/dashboardUser.dart';
import 'package:penitipan/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Middleware {
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
}
