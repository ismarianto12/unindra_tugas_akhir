import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:penitipan/components/NavigateUser.dart';
import 'package:penitipan/pages/penitipan/FormBayarPen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../env.dart';

class PenitipanList extends StatefulWidget {
  @override
  _PenitipanListState createState() => _PenitipanListState();
}

class _PenitipanListState extends State<PenitipanList> {
  List<dynamic> dataPenitipan = [];

  String level = '';
  String username = '';
  Future<void> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    String level = prefs.getString("level").toString();
    String username = prefs.getString("username").toString();
    setState(() => this.level = level);
  }

  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  late Uri url;
  Future<void> fetchData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String iduser = pref.getString("userid").toString();
    String level = pref.getString('level').toString();

    if (level == '1') {
      url = Uri.parse(API_URL + '/penitipan/list');
    } else {
      url = Uri.parse(API_URL + '/penitipan/list?userid=' + iduser.toString());
    }
    print(url);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseBody = response.body;
      if (responseBody != null) {
        setState(() {
          dataPenitipan = json.decode(responseBody);
        });
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Color _statusColor(String data) {
    if (data.toString() == '1') {
      // finish

      return Colors.green;
    } else if (data.toString() == '2') {
      // processed
      return Colors.red;
    } else {
      return Colors.orange;
    }
  }

  Icon _iconStatus(String data) {
    if (data.toString() == '1') {
      return Icon(Icons.check);
    } else if (data.toString() == '2') {
      return Icon(Icons.refresh);
    } else {
      return Icon(Icons.now_widgets_sharp);
    }
  }

  void confirm(int data) async {
    var url = Uri.parse(API_URL + '/pengembalian/penitipan');
    var response = await http.post(url, body: {
      'id': data.toString(),
    });
    print('${response.body}');
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dat Penitipan Berhasil'),
          duration: Duration(seconds: 2),
        ),
      );
      return fetchData();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data Gagal di konfirmasi'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 8, 200, 18),
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        onPressed: () {
          fetchData();
        },
      ),
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    // width: double.infinity,
                    // height: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 10, 56, 208),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1620121478247-ec786b9be2fa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fHw%3D&w=1000&q=80"),
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "List Penitipan Barang",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.16),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 100,
                      height: MediaQuery.of(context).size.height - 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color.fromARGB(255, 49, 49, 49),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 214, 212, 212)),
                                ),
                                hintText: 'Cari ...',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 56, 56, 56)),
                              ),
                              controller: searchController,
                              onChanged: (value) {
                                setState(() {
                                  searchQuery = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'STATUS : ',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                  color:
                                      const Color.fromARGB(255, 249, 249, 249),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Belum Bayar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  color: Colors.orange,
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Sudah Bayar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: dataPenitipan.length,
                              itemBuilder: (context, index) {
                                var listdata = dataPenitipan[index];

                                if (searchQuery.isEmpty ||
                                    dataPenitipan[index]['namaBarang']
                                        .toLowerCase()
                                        .contains(searchQuery.toLowerCase())) {
                                  // Item should be displayed
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 219, 223, 223),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Container(
                                                  padding: EdgeInsets.all(16),
                                                  color: _statusColor(
                                                      listdata['status'] != null
                                                          ? listdata['status']
                                                              .toString()
                                                          : '3'),
                                                  child: Icon(
                                                    size: 18.0,
                                                    Icons.view_list_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(dataPenitipan[index]
                                                          ?['namaBarang'] ??
                                                      'Undefined'),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(dataPenitipan[index]
                                                          ?['biayaPenitipan'] ??
                                                      'Undefined'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              print(dataPenitipan[index]
                                                  ['status']);
                                              if (level == '1') {
                                                if (dataPenitipan[index]
                                                            ['status']
                                                        .toString() ==
                                                    '2') {
                                                  _showConfirmationDialog(
                                                      dataPenitipan[index]);
                                                } else {
                                                  _notifStatus(
                                                      dataPenitipan[index]);
                                                }
                                              } else {
                                                if (dataPenitipan[index]
                                                            ['status']
                                                        .toString() ==
                                                    '1') {
                                                  _notifStatus(
                                                      dataPenitipan[index]);
                                                } else if (dataPenitipan[index]
                                                            ['status']
                                                        .toString() ==
                                                    '2') {
                                                  _notifStatus(
                                                      dataPenitipan[index]);
                                                } else {
                                                  _konfirmasiBayar(
                                                      dataPenitipan[index]);
                                                }
                                              }
                                            },
                                            child: _iconStatus(
                                                listdata['status'] != null
                                                    ? listdata['status']
                                                        .toString()
                                                    : '3'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  if (index == 0) {
                                    return Container(
                                      child: Image.network(
                                          'https://static.vecteezy.com/system/resources/previews/012/181/008/non_2x/document-data-file-not-found-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-etc-vector.jpg'),
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _konfirmasiBayar(data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // dialog tidak bisa ditutup dengan menekan area di luar dialog
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: Text('Konfirmasi Pembayaran ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.network(
                  "https://icon-library.com/images/confirm-icon/confirm-icon-16.jpg",
                  height: 200,
                  width: 200,
                ),
                Text('Nama barang :' + data['namaBarang']),
                Text('Biaya Penitipan: ' + data['biayaPenitipan']),
                Text('Bayar : ' 'Via Operator'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors
                                .red; // Color when the button is pressed.
                          }
                          return Color.fromARGB(255, 20, 215,
                              88); // Default color for the button.
                        },
                      ),
                    ),
                    onPressed: () => null,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('Contact Via Whatsapps',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text('Konfirmasi',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (context) => FormBayarPen(databayar: data));
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

  Future<void> _showConfirmationDialog(data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // dialog tidak bisa ditutup dengan menekan area di luar dialog
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: Text('Konfirmasi Pengembalian ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.asset(
                  "assets/images/penitipan_image.png",
                  height: 200,
                  width: 200,
                ),
                Text('Nama barang :' + data['namaBarang']),
                Text('Biaya Penitipan: ' + data['biayaPenitipan']),
                Text('Bayar : ' 'Via Operator'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors
                                .red; // Color when the button is pressed.
                          }
                          return Color.fromARGB(255, 20, 215,
                              88); // Default color for the button.
                        },
                      ),
                    ),
                    onPressed: () => null,
                    child: Text('Detail Peniitpan',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Center(
                  child: Text('Konfirmasi',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                Navigator.of(context).pop();
                return confirm(data['id']);
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

  Future<void> _notifStatus(data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // dialog tidak bisa ditutup dengan menekan area di luar dialog
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: Text(
              data['status'] == '1' ? 'Sudah selesai' : 'Masih dalam proses'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.network(
                  "https://www.icegif.com/wp-content/uploads/2023/07/icegif-1268.gif",
                  height: 200,
                  width: 200,
                ),
                Text(data['status'] == '1'
                    ? 'Status Penitipan Sudah selesai'
                    : 'Masih dalam proses'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors
                                .red; // Color when the button is pressed.
                          }
                          return Color.fromARGB(255, 20, 215,
                              88); // Default color for the button.
                        },
                      ),
                    ),
                    onPressed: () => null,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('Contact Via Whatsapps',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text('Konfirmasi',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ya'),
              onPressed: () {},
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
