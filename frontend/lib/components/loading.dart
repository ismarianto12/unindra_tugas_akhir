import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final bool isVisible;

  LoadingDialog({required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: AlertDialog(
        content: Row(
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text("Loading..."),
          ],
        ),
      ),
    );
  }
}
