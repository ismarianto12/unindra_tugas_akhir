import 'package:penitipan/components/Navigate.dart';
import 'package:flutter/material.dart';
import 'package:penitipan/components/NavigateUser.dart';
import 'package:penitipan/pages/LaporanPenitipan.dart';
import 'package:penitipan/pages/LaporanPinjam.dart';
import 'package:penitipan/pages/dashboardUser.dart';
import 'package:penitipan/pages/firstmenu.dart';
import 'package:penitipan/pages/login.dart';
import 'package:penitipan/pages/master/ListMaster.dart';
import 'package:penitipan/pages/master/user/ListUser.dart';
import 'package:penitipan/pages/peminjaman/ListPinjam.dart';
import 'package:penitipan/pages/peminjaman/PeminjamanBarang.dart';
import 'package:penitipan/pages/pengembalian/pengembalian.dart';
import 'package:penitipan/pages/penitipan/PenitipanBarangForm.dart';
import 'package:penitipan/pages/penitipan/penitipanList.dart';
import 'package:penitipan/pages/returnpinjam/Returnpinjam.dart';
import 'package:penitipan/service/middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Future<String> getSharedPreferencesValue() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String value = prefs
          .getString('level')
          .toString(); // Replace 'key' with your own key
      return value;
    }

    Future<dynamic> levelAcc() async {
      final String levelid = await Middleware.accesslogin('levelid');
      return levelid.toString();
    }

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => Navigate());
      case '/home':
        return MaterialPageRoute(builder: (_) => Navigate());
      case '/feed':
        return MaterialPageRoute(builder: (_) => Navigate());
      case '/printdata':
        return MaterialPageRoute(builder: (_) => Navigate());
      case '/saldo':
        return MaterialPageRoute(builder: (_) => Navigate());
      case '/masterdat':
        return MaterialPageRoute(builder: (_) => ListMaster());
      // admin panel
      case '/user':
        return MaterialPageRoute(builder: (_) => ListUser());
      case '/formpenitipan':
        return MaterialPageRoute(builder: (_) => PenitipanBarangForm());
      case '/penitipanlist':
        return MaterialPageRoute(builder: (_) => PenitipanList());
      case '/peminjamanform':
        return MaterialPageRoute(builder: (_) => PeminjamanBarangForm());
      case '/peminjamanlist':
        return MaterialPageRoute(builder: (_) => ListPinjam());
      case '/pengembalian':
        return MaterialPageRoute(builder: (_) => Pegembalian());
      case '/returnpinjam':
        return MaterialPageRoute(builder: (_) => Returpinjam());
      case '/tambahpenitipan':
        return MaterialPageRoute(builder: (_) => FirstMenu());
      // Use PenitipanList widget for penitipanlist route
      // user login user
      case '/dashboard_user':
        return MaterialPageRoute(builder: (_) => DashboarUser());
      case '/laporan_peminjaman':
        return MaterialPageRoute(builder: (_) => LaporanPinjam());
      case '/laporan_penitipan':
        return MaterialPageRoute(builder: (_) => LaporanPenitipan());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    child: Text(
                      'Page Under Maintence, Page Route : ${settings.name}',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.red, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {
                    print(levelAcc);
                    // Navigator.of(_).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (context) => const Navigate(),
                    //   ),
                    // );
                    if (levelAcc() == "1") {
                      Route route =
                          MaterialPageRoute(builder: (_) => const Navigate());
                      Navigator.push(_, route);
                    } else {
                      Route route = MaterialPageRoute(
                          builder: (_) => const NavigateUser());
                      Navigator.push(_, route);
                    }
                  },
                  child: const Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      'Back To Home',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}
