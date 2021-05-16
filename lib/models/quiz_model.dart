class QuizModel {
  bool success;
  int questionCount;
  List<Question> data;

  QuizModel({this.success, this.questionCount, this.data});

  QuizModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    questionCount = json['questionCount'];
    if (json['data'] != null) {
      data = <Question>[];
      json['data'].forEach((v) {
        data.add(new Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['questionCount'] = this.questionCount;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  int id;
  String question;
  int answerIndex;
  List<String> options;

  Question({this.id, this.question, this.answerIndex, this.options});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answerIndex = json['answer_index'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer_index'] = this.answerIndex;
    data['options'] = this.options;
    return data;
  }
}
