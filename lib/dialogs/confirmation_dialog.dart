import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog(
      {Key? key, required this.message, required this.tittleDialog})
      : super(key: key);
  final String message;
  final String tittleDialog;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tittleDialog),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop<bool>(context, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop<bool>(context, true),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
