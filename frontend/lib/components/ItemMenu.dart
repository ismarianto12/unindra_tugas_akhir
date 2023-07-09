import 'package:flutter/material.dart';
import '../model/menugrid.dart';

List<MenuItem> menuItems = [
  MenuItem(
    title: 'List Penitipan',
    icon: Icons.money,
    colors: Color.fromARGB(255, 186, 167, 21),
    route: '/penitipanlist',
  ),
  MenuItem(
    title: 'Form Penitipan',
    icon: Icons.map,
    colors: Color.fromARGB(255, 142, 227, 144),
    route: '/formpenitipan',
  ),
  MenuItem(
    title: 'Keterlambatan',
    icon: Icons.settings,
    colors: Color.fromARGB(255, 14, 142, 105),
    route: '/saldo',
  ),
  MenuItem(
    title: 'Penitipan',
    icon: Icons.settings,
    colors: Color.fromARGB(255, 13, 189, 98),
    route: '/penitipanlist',
  ),
  MenuItem(
    title: 'Tracking',
    icon: Icons.settings,
    colors: Colors.orange[400],
    route: '/tracking',
  ),
  MenuItem(
    title: 'Penitipan',
    icon: Icons.settings,
    colors: Colors.orange[500],
    route: '/saldo',
  ),
  MenuItem(
    title: 'Peminjaman',
    icon: Icons.settings,
    colors: const Color.fromARGB(255, 25, 203, 31),
    route: '/laporan_peminjaman',
  ),
  MenuItem(
    title: 'Pendapatan',
    icon: Icons.settings,
    colors: const Color.fromARGB(255, 48, 191, 52),
    route: '/saldo',
  ),
  // tambahkan item lainnya
];
