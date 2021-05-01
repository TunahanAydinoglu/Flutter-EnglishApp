class LastWord {
  int counter;
  bool isMemory;
  String sId;
  String word;
  String translation;
  String user;
  String createdAt;

  LastWord(
      {this.counter,
      this.isMemory,
      this.sId,
      this.word,
      this.translation,
      this.user,
      this.createdAt});

  LastWord.fromJson(Map<String, dynamic> json) {
    counter = json['counter'];
    isMemory = json['isMemory'];
    sId = json['_id'];
    word = json['word'];
    translation = json['translation'];
    user = json['user'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counter'] = this.counter;
    data['isMemory'] = this.isMemory;
    data['_id'] = this.sId;
    data['word'] = this.word;
    data['translation'] = this.translation;
    data['user'] = this.user;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class LastWordsResponseModel {
  bool success;
  List<Data> data;

  LastWordsResponseModel({this.success, this.data});

  LastWordsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int counter;
  bool isMemory;
  String sId;
  String word;
  String translation;
  String user;
  String createdAt;
  int iV;

  Data(
      {this.counter,
      this.isMemory,
      this.sId,
      this.word,
      this.translation,
      this.user,
      this.createdAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    counter = json['counter'];
    isMemory = json['isMemory'];
    sId = json['_id'];
    word = json['word'];
    translation = json['translation'];
    user = json['user'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counter'] = this.counter;
    data['isMemory'] = this.isMemory;
    data['_id'] = this.sId;
    data['word'] = this.word;
    data['translation'] = this.translation;
    data['user'] = this.user;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
