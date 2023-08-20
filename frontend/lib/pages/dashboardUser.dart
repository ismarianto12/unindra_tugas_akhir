import 'package:flutter/material.dart';
import 'package:penitipan/components/ListPromo.dart';
import 'package:penitipan/pages/login.dart';
import 'package:penitipan/pages/peminjaman/ListPinjam.dart';
import 'package:penitipan/pages/penitipan/penitipanList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboarUser extends StatefulWidget {
  const DashboarUser({super.key});

  @override
  State<DashboarUser> createState() => _DashboarUserState();
}

class _DashboarUserState extends State<DashboarUser> {
  @override
  String level = '';
  String username = '';
  Future<void> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    String level = prefs.getString("level").toString();
    String username = prefs.getString("username").toString();
    setState(() => {this.level = level, this.username = username});
  }

  void initState() {
    super.initState();
    getUsername();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                background_container(context),
                Positioned(child: background_child(context), bottom: -10),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            menuradiend(context),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    'https://static.vecteezy.com/system/resources/previews/010/896/688/original/menu-icon-sign-symbol-design-free-png.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Center(
                    child: Text(
                      "List Promo",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListPromo()
          ],
        ),
      )),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 3, 95, 170),
                Color.fromARGB(255, 20, 6, 75)
              ],
            ),
            // borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.elliptical(y:120,x:10),
            //   bottomRight: Radius.circular(120),
            // ),
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).pop();
                    //   },
                    //   child: Icon(Icons.arrow_back, color: Colors.white),
                    // ),
                    Text(
                      'Penitipan dan Peminjaman Barang',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),

                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pop();
                        // Route route = MaterialPageRoute(
                        //     builder: (context) => const Login());
                        // Navigator.push(context, route);
                      },
                      child: GestureDetector(
                        onTap: () {
                          _showConfirmationDialog();
                        },
                        child: Icon(
                          Icons.login_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container background_child(BuildContext context) {
    double containerWidth =
        MediaQuery.of(context).size.width * 0.91; // 90% of the screen width

    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: containerWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.purple],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  'https://static.vecteezy.com/system/resources/previews/010/896/688/original/menu-icon-sign-symbol-design-free-png.png',
                  height: 40,
                  width: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      'Hy ${username.toUpperCase()} Welcome',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'tahoma',
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Center(
                      child: Text(
                        "Menu Utama",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container menuradiend(BuildContext context) {
    double containerWidth =
        MediaQuery.of(context).size.width * 0.98; // 90% of the screen width

    return Container(
      height: 110,
      width: containerWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple, const Color.fromARGB(255, 10, 91, 158)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          children: [
            // Your grid items
            InkWell(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (context) => PenitipanList());
                Navigator.push(context, route);
              },
              child: Container(
                child: Column(
                  children: [
                    Image.network(
                      "https://static.vecteezy.com/system/resources/previews/010/146/533/original/tax-icon-sign-symbol-design-free-png.png",
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(height: 10),
                    Text('PENITIPAN', style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Route router = MaterialPageRoute(
                  builder: (context) => ListPinjam(),
                );
                Navigator.push(context, router);
              },
              child: Container(
                child: Column(
                  children: [
                    Image.network(
                      "https://bangun-rumah.com/wp-content/uploads/survey-icon-12.png",
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(height: 10),
                    Text('PEMINJAMAN', style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/riwayat_bayar');
              },
              child: Container(
                child: Column(
                  children: [
                    Image.network(
                      "https://static.vecteezy.com/system/resources/previews/010/148/344/original/tax-icon-sign-symbol-design-free-png.png",
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(height: 10),
                    Text('REPORT', style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listPromo(BuildContext context) {
    return SizedBox(
      height: 120,
      // width: ,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Card(
            child: Image.network(
              "https://images.tokopedia.net/img/home/defaultbanner/59e9ecd0-b91b-40d4-aef8-b1057be0_auto_x2.jpg?ect=4g",
              fit: BoxFit.cover,
            ),
          ),
          Card(
            child: Image.network(
              "https://images.tokopedia.net/img/NsjrJu/2020/9/25/b1d2ed1e-ef80-4d7a-869f-a0394f0629be.jpg?ect=4g",
              fit: BoxFit.cover,
            ),
          ),
          Card(
            child: Image.network(
              "https://images.tokopedia.net/img/cache/1208/NsjrJu/2023/7/13/039df565-dd90-4835-afcf-f8070be80401.jpg?ect=4g",
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  static Future<String?> logout() async {
    SharedPreferences getval = await SharedPreferences.getInstance();
    getval.remove("token");
    getval.remove("level");
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // dialog tidak bisa ditutup dengan menekan area di luar dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Keluar dari aplikasi?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                logout();
                Route route =
                    MaterialPageRoute(builder: (context) => const Login());
                Navigator.push(context, route);
              },
            ),
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
          ],
        );
      },
    );
  }
}
