import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/LastWords/lastwords_view_model.dart';
import 'package:flutter_auth/core/base/base_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'lastwords_model.dart';

isSuccessGetUserWordsHelper(String token, LastWordsViewModel viewModel) async {
  await viewModel.getUserLastWords(token);
}

class LastWordsScreen extends StatefulWidget {
  final String token;

  const LastWordsScreen({Key key, this.token}) : super(key: key);

  @override
  _LastWordsScreenState createState() => _LastWordsScreenState();
}

class _LastWordsScreenState extends BaseState<LastWordsScreen> {
  // List<LastWord> lastWords;
  final _lastWordsViewModel = LastWordsViewModel();

  @override
  void initState() {
    _lastWordsViewModel.getUserLastWords(widget.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Words"),
      ),
      body: Observer(builder: (_) {
        return Container(
          child: _lastWordsViewModel.lastWords.length > 0
              ? listWordsWidget(_lastWordsViewModel.lastWords)
              : Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }

  ListView listWordsWidget(List<LastWord> lastWords) => ListView.builder(
        itemCount: lastWords.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: dynamicWidth(0.3),
                  child: Text(lastWords[index].word),
                ),
                Text(lastWords[index].translation),
                Icon(Icons.check)
              ],
            ),
          ),
        ),
      );
}
