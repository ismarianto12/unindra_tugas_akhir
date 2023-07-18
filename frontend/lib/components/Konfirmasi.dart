// import 'package:flutter/material.dart';

// class Konfirmasi extends StatelessWidget {
//   final String judul;
//   final String keterangan;

//   const Konfirmasi({Key? key, required this.judul, required this.keterangan})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Future<void> _showConfirmationDialog(BuildContext context) async {
//       return showDialog<void>(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(judul),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: <Widget>[
//                   Text(keterangan),
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('Ya'),
//                 onPressed: () {
//                   // Perform the desired action here
//                   Navigator.pop(context); // Close the dialog
//                 },
//               ),
//               TextButton(
//                 child: Text('Tidak'),
//                 onPressed: () {
//                   Navigator.pop(context); // Close the dialog
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }
