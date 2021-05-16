import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profile/profile_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/core/base/base_state.dart';
import 'package:flutter_auth/models/quiz_model.dart';
import 'package:flutter_auth/models/user_model.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;
  final String token;
  final User user;

  const QuizScreen({Key key, this.questions, this.token, this.user})
      : super(key: key);
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends BaseState<QuizScreen> {
  List<Color> _resultColor = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent
  ];
  int _showQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text("Quiz"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          IconButton(
              icon: Icon(
                Icons.person_outline,
                size: 30,
              ),
              onPressed: () {
                print(widget.user.name);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                            token: widget.token, user: widget.user)));
              }),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: questionCardWidget(context, widget.questions, _showQuestionIndex),
    );
  }

  Column questionCardWidget(
      BuildContext context, List<Question> questions, int questionIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: kDefaultPadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text.rich(
            TextSpan(
              text: "Question ${questionIndex + 1}",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: kSecondaryColor),
              children: [
                TextSpan(
                  text: "/${questions.length}",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: kSecondaryColor),
                ),
              ],
            ),
          ),
        ),
        Divider(thickness: 1.5),
        SizedBox(height: kDefaultPadding),
        answersWidget(questions[questionIndex]),
        SizedBox(height: kDefaultPadding),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {
                    if (_showQuestionIndex != 0) {
                      setState(() {
                        _showQuestionIndex--;
                        _resultColor = [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent
                        ];
                      });
                    }
                  }),
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 30,
                  ),
                  onPressed: () {
                    if (_showQuestionIndex != questions.length - 1) {
                      setState(() {
                        _resultColor = [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent
                        ];
                        _showQuestionIndex++;
                      });
                    }
                  })
            ],
          ),
        ),
      ],
    );
  }

  Column answersWidget(Question question) {
    return Column(
      children: [
        Text(
          question.question,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == question.answerIndex) {
                    setState(() {
                      _resultColor[index] = Colors.green;
                    });
                  } else {
                    setState(() {
                      _resultColor[index] = Colors.red;
                    });
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: kDefaultPadding,
                      left: kDefaultPadding,
                      right: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: kGrayColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${index + 1}. ${question.options[index]}",
                        style: TextStyle(fontSize: 17),
                      ),
                      Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                            color: _resultColor[index],
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: kGrayColor)),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}
