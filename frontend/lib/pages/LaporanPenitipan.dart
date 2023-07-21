import 'package:flutter/material.dart';
import 'package:penitipan/components/Navigate.dart';
import 'package:penitipan/components/TableReport.dart';

class LaporanPenitipan extends StatefulWidget {
  const LaporanPenitipan({super.key});

  @override
  State<LaporanPenitipan> createState() => _LaporanPenitipanState();
}

class _LaporanPenitipanState extends State<LaporanPenitipan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Color.fromARGB(255, 227, 179, 5), // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.restore,
                      color: Color.fromARGB(255, 202, 89, 89),
                    ),
                    Text(
                      'Total Penitipan',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                height: 210,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/free-vector/gradient-ui-ux-background_23-2149051556.jpg'), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [
                  //     const Color.fromARGB(255, 3, 95, 170),
                  //     Color.fromARGB(255, 20, 6, 75)
                  //   ],
                  // ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => const Navigate());
                    Navigator.push(context, route);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Icon(
                            Icons.arrow_back_ios,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Back Homes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 180),
                  height: MediaQuery.of(context).size.height * 0.80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Color.fromARGB(255, 246, 246, 246),
                    //     Color.fromARGB(255, 235, 235, 237)
                    //   ],
                    // ),
                  ),
                  child: Column(children: [
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 189, 186, 186),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.59,
                      // height: 10,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                            "https://cdn-icons-png.flaticon.com/512/3286/3286722.png",
                            height: 50,
                            width: 50),
                        SizedBox(width: 10),
                        Text(
                          'Laporan Penitipan',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 20),
                    Expanded(child: TableReport()),
                    SizedBox(height: 220),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
