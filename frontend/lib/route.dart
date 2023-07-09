import 'package:penitipan/components/Navigate.dart';
import 'package:flutter/material.dart';
import 'package:penitipan/pages/master/ListMaster.dart';
import 'package:penitipan/pages/master/user/ListUser.dart';
import 'package:penitipan/pages/penitipan/PenitipanBarangForm.dart';
import 'package:penitipan/pages/penitipan/penitipanList.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => Navigate());
      case '/home':
        return MaterialPageRoute(builder: (_) => Navigate());
      case '/feed':
        return MaterialPageRoute(builder: (_) => Navigate());
      case '/tambahpenitipan':
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
        return MaterialPageRoute(
            builder: (_) =>
                PenitipanList()); // Use PenitipanList widget for penitipanlist route

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Column(
              children: [
                Center(
                  child: Text(
                    'Page Under Maintence, Page Route : ${settings.name}',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
                MaterialButton(
                  color: Colors.red, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(_, "/dashboard");
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
