import 'package:flutter/material.dart';
import 'package:flutter_auth/core/base/base_state.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends BaseState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.grey[700], size: 25),
      backgroundColor: Colors.white,
      elevation: 1,
      title: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        Icon(Icons.notifications_active_outlined),
        Icon(Icons.flag_outlined),
        Icon(Icons.settings),
        SizedBox(
          width: dynamicWidth(0.02),
        )
      ],
    );
  }
}
