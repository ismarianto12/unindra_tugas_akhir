import 'package:flutter/material.dart';

import '../../service/service.dart';

class Returpinjam extends StatefulWidget {
  const Returpinjam({super.key});

  @override
  State<Returpinjam> createState() => _ReturpinjamState();
}

class _ReturpinjamState extends State<Returpinjam>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _nomortransaksiController = TextEditingController();

  bool loaded = false;
  final List<dynamic> data = [];

  void _search() {
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    final transactiondata = _nomortransaksiController.text;
    // final getDetail = Service.returnPinjam(transactiondata);
    // setState(() {
    //   // data = getDetail;
    // });
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Image.asset("assets/images/returndua.png"),
            Form(
              key: _formkey,
              child: Row(
                children: [
                  TextFormField(
                    controller: _nomortransaksiController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nomor Transasksi wajib di isi";
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            MaterialButton(
              // height: 10.0,
              color: Color.fromARGB(255, 15, 7, 164), // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: _search,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    Text(
                      'Cari Data',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            if (!loaded)
              Text("silahlan masukan nomor transaski")
            else
              Table(
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Text("Nama Barang"),
                    ),
                    TableCell(
                      child: Text("Nama Barang"),
                    ),
                    TableCell(
                      child: Text("Nama Barang"),
                    ),
                    TableCell(
                      child: Text("Nama Barang"),
                    ),
                  ])
                ],
              )
          ],
        ),
      ),
    );
  }
}
