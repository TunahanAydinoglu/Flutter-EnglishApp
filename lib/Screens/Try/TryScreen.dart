import 'package:flutter/material.dart';

class TryScreen extends StatefulWidget {
  @override
  _TryScreenState createState() => _TryScreenState();
}

class _TryScreenState extends State<TryScreen> {
  @override
  Widget build(BuildContext context) {
    final mySize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Words"),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: mySize.width * 0.3,
                  child: Text("congratulations"),
                ),
                Text("Tebrikler"),
                Icon(Icons.check)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
