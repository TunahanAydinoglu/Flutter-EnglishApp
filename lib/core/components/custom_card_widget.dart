import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          title: Text("Average Price",
              style: TextStyle(
                  color: Colors.blueGrey[400], fontWeight: FontWeight.w600)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              '\$ 1.235',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.file_copy_outlined),
            onPressed: () {},
            color: Colors.blue,
            splashColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
