import 'package:flutter/material.dart';

Future<void> buildShowDialog(
    BuildContext context, String title, String message) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        // content: SingleChildScrollView(
        //   child: ListBody(
        //     children: <Widget>[
        //       Text('This is a demo alert dialog.'),
        //       Text('Would you like to approve of this message?'),
        //     ],
        //   ),
        // ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
