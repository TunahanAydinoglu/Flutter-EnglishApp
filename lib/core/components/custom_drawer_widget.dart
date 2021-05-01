import 'package:flutter/material.dart';
import 'package:flutter_auth/core/base/base_state.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends BaseState<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: dynamicWidth(0.6),
        child: Drawer(
          child: Container(
            color: Color(0xff2a2f42),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  height: dynamicHeight(0.11),
                  child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: Container(
                      width: dynamicWidth(0.4),
                      height: dynamicHeight(0.11),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo-3.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 25,
                    itemBuilder: (context, index) => drawerListItems(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget drawerListItems(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      children: [
        Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/cardList");
              },
              child: Text(
                'Satin Alma Talebi',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        )
      ],
    ),
  );
}
