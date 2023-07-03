import 'package:flutter/material.dart';
import '../model/menugrid.dart';

List<MenuItem> menuItems = [
  MenuItem(
    title: 'Saldo',
    icon: Icons.money,
    colors: Color.fromARGB(255, 186, 167, 21),
    route: '/saldo',
  ),
  MenuItem(
    title: 'Lokasi',
    icon: Icons.map,
    colors: Color.fromARGB(255, 142, 227, 144),
    route: '/saldo',
  ),
  MenuItem(
    title: 'Status',
    icon: Icons.settings,
    colors: Color.fromARGB(255, 14, 142, 105),
    route: '/saldo',
  ),
  MenuItem(
    title: 'Penitipan',
    icon: Icons.settings,
    colors: Color.fromARGB(255, 13, 189, 98),
    route: '/penitipan',
  ),
  MenuItem(
    title: 'Tracking',
    icon: Icons.settings,
    colors: Colors.orange[400],
    route: '/tracking',
  ),
  MenuItem(
    title: 'Item 6',
    icon: Icons.settings,
    colors: Colors.orange[500],
    route: '/saldo',
  ),
  MenuItem(
    title: 'Item 7',
    icon: Icons.settings,
    colors: Colors.green[100],
    route: '/saldo',
  ),
  MenuItem(
    title: 'Item 8',
    icon: Icons.settings,
    colors: Colors.green[100],
    route: '/saldo',
  ),
  // tambahkan item lainnya
];
