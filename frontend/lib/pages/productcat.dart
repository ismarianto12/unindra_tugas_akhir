import 'package:penitipan/components/listprod.dart';
import 'package:flutter/material.dart';

class Productcat extends StatefulWidget {
  const Productcat({super.key});

  @override
  State<Productcat> createState() => _ProductcatState();
}

class _ProductcatState extends State<Productcat> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                TextField(
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      labelText: "Cari Product Terpopuler"),
                ),
                Icon(Icons.shopping_bag),
              ],
            ),
          ),
          Expanded(
            child: ListProd(),
          ),
        ],
      ),
    ));
  }
}
