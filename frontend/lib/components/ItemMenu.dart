import 'package:flutter/material.dart';
import '../model/menugrid.dart';

List<MenuItem> menuItems = [
  MenuItem(
    title: 'Transaksi Penitipan',
    icon: Icons.money,
    colors: Color.fromARGB(255, 186, 167, 21),
    route: '/saldo',
  ),
  MenuItem(
    title: 'Pengembalian',
    icon: Icons.map,
    colors: Color.fromARGB(255, 142, 227, 144),
    route: '/saldo',
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
    route: '/penitipan',
  ),
  MenuItem(
    title: 'Tracking',
    icon: Icons.settings,
    colors: Colors.orange[400],
    route: '/tracking',
  ),
  MenuItem(
    title: 'Laporan Penitipan',
    icon: Icons.settings,
    colors: Colors.orange[500],
    route: '/saldo',
  ),
  MenuItem(
    title: 'Laporan Peminjaman',
    icon: Icons.settings,
    colors: const Color.fromARGB(255, 25, 203, 31),
    route: '/saldo',
  ),
  MenuItem(
    title: 'Laporan Pendapatan',
    icon: Icons.settings,
    colors: const Color.fromARGB(255, 48, 191, 52),
    route: '/saldo',
  ),
  // tambahkan item lainnya
];
