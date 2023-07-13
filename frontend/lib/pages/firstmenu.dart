import 'package:flutter/material.dart';
import 'package:penitipan/components/Navigate.dart';
import 'package:penitipan/pages/peminjaman/PeminjamanBarang.dart';
import 'package:penitipan/pages/penitipan/PenitipanBarangForm.dart';

class FirstMenu extends StatefulWidget {
  const FirstMenu({super.key});

  @override
  State<FirstMenu> createState() => _FirstMenuState();
}

class _FirstMenuState extends State<FirstMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(137, 137, 14, 218),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => Navigate());
          Navigator.push(context, route);
        },
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 35),
          Image.asset(
            "assets/images/penitipan_image.png",
            height: 200,
            width: 200,
          ),
          Text(
            'Pilih Action :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          SizedBox(height: 25),
          InkWell(
            onTap: () {
              Route route = MaterialPageRoute(
                  builder: (context) => PenitipanBarangForm());
              Navigator.push(context, route);
            },
            child: Card(
              color: Colors.blueAccent,
              child: ListTile(
                title: Text(
                  'Penitipan Barang',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Total : 129',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.navigate_next_outlined,
                  color: Colors.white,
                ),
                // leading: Text('Penitipan Barang'),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Route route = MaterialPageRoute(
                  builder: (context) => PeminjamanBarangForm());
              Navigator.push(context, route);
            },
            child: Card(
              color: Color.fromARGB(255, 7, 202, 127),
              child: ListTile(
                title: Text(
                  'Peminjaman Barang',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Total : 129',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.navigate_next_outlined,
                  color: Colors.white,
                ),
                // leading: Text('Penitipan Barang'),
              ),
            ),
          )
        ],
      )),
    );
  }
}
