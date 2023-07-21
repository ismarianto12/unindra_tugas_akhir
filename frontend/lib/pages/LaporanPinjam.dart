import 'package:flutter/material.dart';
import 'package:penitipan/components/Navigate.dart';
import 'package:penitipan/components/TableReport.dart';

class LaporanPinjam extends StatefulWidget {
  const LaporanPinjam({super.key});

  @override
  State<LaporanPinjam> createState() => _LaporanPinjamState();
}

class _LaporanPinjamState extends State<LaporanPinjam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 210.0,
                pinned: true, // Keeps the app bar visible while scrolling
                flexibleSpace: Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/free-vector/gradient-ui-ux-background_23-2149051556.jpg'), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Route route = MaterialPageRoute(
                          builder: (context) => const Navigate(),
                        );
                        Navigator.push(context, route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Icon(
                              Icons.arrow_back_ios,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Back Home',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 189, 186, 186),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.59,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/3286/3286722.png",
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Laporan Peminjaman',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: TableReport()),
                  SizedBox(height: 220),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
