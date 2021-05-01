import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/LastWords/lastwords_view_model.dart';
import 'package:flutter_auth/core/base/base_state.dart';

isSuccessGetUserWordsHelper() async {
  final _lastWordsViewModel = LastWordsViewModel();

  final wordsResponse = await _lastWordsViewModel.getUserLastWords();
  print(wordsResponse);
}

class LastWordsView extends StatefulWidget {
  @override
  _LastWordsViewState createState() => _LastWordsViewState();
}

class _LastWordsViewState extends BaseState<LastWordsView> {
  @override
  void initState() {
    isSuccessGetUserWordsHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Words"),
      ),
      body: 5 > 0 ? listWordsWidget : CircularProgressIndicator(),
    );
  }

  ListView get listWordsWidget => ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: dynamicWidth(0.3),
                  child: Text("congratulations"),
                ),
                Text("Tebrikler"),
                Icon(Icons.check)
              ],
            ),
          ),
        ),
      );
}
