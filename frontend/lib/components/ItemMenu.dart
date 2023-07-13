import 'package:flutter/material.dart';
import '../model/menugrid.dart';

List<MenuItem> menuItems = [
  MenuItem(
    title: 'List',
    subtitle: 'Penitipan',
    icon: Icons.money,
    colors: Color.fromARGB(255, 186, 167, 21),
    route: '/penitipanlist',
  ),
  MenuItem(
    title: 'Form',
    subtitle: 'Penitipan',
    icon: Icons.map,
    colors: Color.fromARGB(255, 142, 227, 144),
    route: '/formpenitipan',
  ),
  MenuItem(
    title: 'Pegembalian',
    subtitle: 'Penitipan',
    icon: Icons.keyboard_return_rounded,
    colors: Color.fromARGB(255, 14, 142, 105),
    route: '/pengembalian',
  ),
  MenuItem(
    title: 'Laporan',
    subtitle: 'Penitipan',
    icon: Icons.report,
    colors: Color.fromARGB(255, 13, 189, 98),
    route: '/penitipanlist',
  ),
  MenuItem(
    title: 'Data',
    subtitle: 'Peminjaman',
    icon: Icons.save_as_outlined,
    colors: Colors.orange[400],
    route: '/peminjamanform',
  ),
  MenuItem(
    title: 'Listdata',
    subtitle: 'Peminjaman',
    icon: Icons.verified_user_sharp,
    colors: Colors.orange[500],
    route: '/peminjamanlist',
  ),
  MenuItem(
    title: 'Pengembalian',
    subtitle: 'Barang Pinjam',
    icon: Icons.settings,
    colors: const Color.fromARGB(255, 25, 203, 31),
    route: '/laporan_peminjaman',
  ),
  MenuItem(
    title: 'Pengembalian',
    subtitle: 'Peminjaman',
    icon: Icons.money_off_csred_rounded,
    colors: const Color.fromARGB(255, 48, 191, 52),
    route: '/retunpinjam',
  ),
  // tambahkan item lainnya
];
