import 'package:flutter/material.dart';

class Tandaterima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black), // Set the icon color
        backgroundColor: Colors.white,
        title: Text(
          'Tanda Terima',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Print"),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.print),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/login_app.png",
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Tanda Terima',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text('Nama: John Doe'),
                    Text('Tanggal: 19 Agustus 2023'),
                    SizedBox(height: 16.0),
                    Text('Barang yang Diterima:'),
                    Text('- Smartphone'),
                    Text('- Charger'),
                    Text('- Earphone'),
                    SizedBox(height: 16.0),
                    Text('Tanda Tangan Penerima:'),
                    Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total:'),
                        Text(
                          'Rp 2,500,000',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
