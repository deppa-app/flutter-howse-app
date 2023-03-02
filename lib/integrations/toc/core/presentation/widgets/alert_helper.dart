import 'package:flutter/material.dart';

class AlertHelper {
  static Future<void> showInfoDialog(BuildContext context, String message) async {
    return showCustomDialog(context, message, "Info", () => {});
  }

  static Future<void> showInfoDialogCallBack(BuildContext context, String message, VoidCallback onPressedDelegate) async {
    return showCustomDialog(context, message, "Info", onPressedDelegate);
  }

  static Future<void> showErrorDialog(BuildContext context, String message) async {
    return showCustomDialog(context, message, "Error", () => {});
  }

  static Future<void> showErrorDialogDelegate(BuildContext context, String message, VoidCallback onPressedDelegate) async {
    return showCustomDialog(context, message, "Error", onPressedDelegate);
  }

  static Future<void> showCustomDialog(BuildContext context, String message, String title, VoidCallback onPressedDelegate) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressedDelegate != null) {
                  onPressedDelegate();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
