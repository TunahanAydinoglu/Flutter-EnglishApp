import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profile/profile_screen.dart';
import 'package:flutter_auth/Screens/Quiz/quiz_screen.dart';
import 'package:flutter_auth/Screens/Quiz/quiz_view_model.dart';
import 'package:flutter_auth/Screens/Words/words_view_model.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/core/base/base_state.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translator/translator.dart';

class WordsScreen extends StatefulWidget {
  final String token;

  const WordsScreen({Key key, this.token}) : super(key: key);
  @override
  _WordsScreenState createState() => _WordsScreenState();
}

class _WordsScreenState extends BaseState<WordsScreen> {
  final _wordsViewModel = WordsViewModel();
  final _quizViewModel = QuizViewModel();
  GoogleTranslator translator = new GoogleTranslator();

  @override
  void initState() {
    super.initState();
    _wordsViewModel.getUserWords(widget.token);
    _quizViewModel.getQuizAsync(widget.token);
  }

  void translateWord(toTranslate, index) {
    translator.translate(toTranslate.word, to: 'tr').then((output) {
      String translatedWord = output.toString();
      _wordsViewModel.words[index].translation = translatedWord;
      if (translatedWord.length > 0) {
        _wordsViewModel.postTranslateVocabulary(
            widget.token, toTranslate.word, translatedWord);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      resizeToAvoidBottomInset: false,
      body: Observer(builder: (_) {
        return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [gradientStartColor, gradientEndColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 0.7])),
            child: _wordsViewModel.showWords.length > 0
                ? bodyWidget(context)
                : Center(child: CircularProgressIndicator()));
      }),
      bottomNavigationBar: bottomNavigateWidget(context),
    );
  }

  Widget bottomNavigateWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
      width: double.infinity,
      height: dynamicHeight(0.10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              print("All Words");
              _wordsViewModel.getUserWords(widget.token);
            },
            child: Text(
              "All Words",
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: IconButton(
                highlightColor: Colors.transparent,
                splashRadius: 1,
                color: themeData.accentColor,
                icon: Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 8.5),
                              width: 100,
                              height: 2,
                              color: Colors.grey,
                            ),
                            Text(
                              "You can add new words here..",
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 3),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                onChanged: (String addText) {
                                  _wordsViewModel.onChangeAddText(addText);
                                },
                                maxLines: null,
                                decoration: InputDecoration(
                                    fillColor: themeData.accentColor,
                                    hintText: "Please enter a lot of text",
                                    hintStyle: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    _wordsViewModel.addWords(widget.token);
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.purple.withOpacity(0.8))),
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                }),
          ),
          TextButton(
            onPressed: () {
              print("Your Last Words");
              _wordsViewModel.getUserLastWords();
            },
            child: Text(
              "Last Words",
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SafeArea bodyWidget(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          tapBarWidget(context),
          wordsCardWidget(context),
          Text(
            "${_wordsViewModel.showWords.length} words found.",
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Container wordsCardWidget(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.only(left: 32),
      child: Swiper(
        itemCount: _wordsViewModel.showWords.length,
        itemWidth: MediaQuery.of(context).size.width - 2 * 64,
        layout: SwiperLayout.STACK,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              SizedBox(height: 50),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                color: Colors.white,
                child: Container(
                  height: 300,
                  width: 300,
                  padding: const EdgeInsets.all(32.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _wordsViewModel.showWords[index].word,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 44,
                              color: const Color(0xff47455f),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SvgPicture.asset(
                            "assets/icons/arrow.svg",
                            width: 30,
                            height: 30,
                          ),
                          isEmptyTranslation(index),
                          SizedBox(
                            height: 50,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print("Ok..");
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/ok.svg",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("Deleted..");
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/delete.svg",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        bottom: -20,
                        right: 0,
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 110,
                            color: primaryTextColor.withOpacity(0.08),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding tapBarWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 32, 20, 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Words',
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 44,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.left,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, _) {
                        return QuizScreen(
                          token: widget.token,
                          user: _wordsViewModel.user,
                          questions: _quizViewModel.quizResponseData,
                        );
                      },
                      opaque: false));
                },
                child: SvgPicture.asset(
                  "assets/icons/quiz.svg",
                  width: 35,
                  height: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                              token: widget.token,
                              user: _wordsViewModel.user,
                              wordsCount: _wordsViewModel.words.length)));
                },
                child: SvgPicture.asset(
                  "assets/icons/profile.svg",
                  width: 35,
                  height: 35,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget isEmptyTranslation(int index) {
    return Observer(builder: (_) {
      return Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: _wordsViewModel.showWords[index].translation !=
                  "kelime bulunamadi"
              ? Text(
                  _wordsViewModel.showWords[index].translation,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 23,
                    color: primaryTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                )
              : GestureDetector(
                  onTap: () {
                    translateWord(_wordsViewModel.showWords[index], index);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Tap to Translate",
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black54, width: 2)),
                  ),
                ));
    });
  }
}
