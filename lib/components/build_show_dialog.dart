import 'package:flutter/material.dart';

class BuildShowDialog extends StatelessWidget {
  final String title;
  final String message;
  final BuildContext contextExternal;

  BuildShowDialog({this.title, this.message, this.contextExternal});
  @override
  Widget build(BuildContext context) {
    return buildShowDialog(contextExternal, title, message);
  }
}

buildShowDialog(BuildContext context, String title, String message) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
          ],
        );
      });
}
