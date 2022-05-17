import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scanner/dialogs/confirmation_dialog.dart';
import 'package:qr_scanner/enum/dialogs.dart';

class DialogsProvider {
  DialogsProvider._();

  static final dialogsProvider = DialogsProvider._();

  factory DialogsProvider() {
    return dialogsProvider;
  }

  ///Pull up an dialog on screen
  Future<dynamic> popConfirmationDialog<TResponse>(Dialogs dialog,
      BuildContext context, String message, String tittleDialog) async {
    switch (dialog) {
      case Dialogs.confirmation:
        return await showDialog(
            builder: (BuildContext context) => ConfirmationDialog(
                message: message, tittleDialog: tittleDialog),
            context: context);
    }
  }
}
