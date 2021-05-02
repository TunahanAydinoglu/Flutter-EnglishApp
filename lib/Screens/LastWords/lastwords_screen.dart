import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/LastWords/lastwords_view_model.dart';
import 'package:flutter_auth/Screens/Profile/profile_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/core/base/base_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/userword_model.dart';

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
          title: Text("Last Words"),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.person_outline,
                  size: 30,
                ),
                onPressed: () {
                  print(_lastWordsViewModel.user);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                              token: widget.token,
                              user: _lastWordsViewModel.user)));
                }),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: Observer(builder: (_) {
          return Container(
            child: _lastWordsViewModel.lastWords.length > 0
                ? listWordsWidget(_lastWordsViewModel.lastWords)
                : Center(child: CircularProgressIndicator()),
          );
        }),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          height: dynamicHeight(0.08),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () {
                            print("Your Words");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPurpLight,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30)),
                            ),
                            padding: EdgeInsets.only(left: dynamicWidth(0.06)),
                            alignment: Alignment.centerLeft,
                            height: dynamicHeight(0.07),
                            child: Text(
                              "Your Last Words",
                              style: TextStyle(
                                color: themeData.accentColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () {
                            print("Your Last Words");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPurpLight,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30)),
                            ),
                            padding: EdgeInsets.only(right: dynamicWidth(0.08)),
                            alignment: Alignment.centerRight,
                            height: dynamicHeight(0.07),
                            child: Text(
                              "Your Words",
                              style: TextStyle(
                                color: themeData.accentColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: themeData.primaryColor,
                        ),
                        child: IconButton(
                            highlightColor: themeData.primaryColor,
                            splashRadius: 10,
                            color: themeData.accentColor,
                            icon: Icon(Icons.add),
                            onPressed: () {
                              print("add button");
                            })),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  ListView listWordsWidget(List<UserWord> lastWords) => ListView.builder(
        itemCount: lastWords.length,
        itemBuilder: (context, index) =>
            index == 0 ? indexZeroCard : wordCard(lastWords, index),
      );

  Card get indexZeroCard => Card(
        color: Colors.grey,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: dynamicWidth(0.3),
                  child: Text("Words"),
                ),
                Text("Translations"),
                Icon(Icons.check)
              ],
            ),
          ),
        ),
      );

  Card wordCard(List<UserWord> lastWords, int index) {
    index = index - 1;
    return Card(
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
    );
  }
}
