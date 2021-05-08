class UserWord {
  int counter;
  bool isMemory;
  String sId;
  String word;
  String translation;
  String user;
  int createdAt;
  int updatedAt;

  UserWord(
      {this.counter,
      this.isMemory,
      this.sId,
      this.word,
      this.translation,
      this.user,
      this.createdAt,
      this.updatedAt});

  UserWord.fromJson(Map<String, dynamic> json) {
    counter = json['counter'];
    isMemory = json['isMemory'];
    sId = json['_id'];
    word = json['word'];
    translation = json['translation'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class UserWordsResponseModel {
  bool success;
  List<Data> data;

  UserWordsResponseModel({this.success, this.data});

  UserWordsResponseModel.fromJson(Map<String, dynamic> json) {
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
  int createdAt;
  int updatedAt;
  int iV;

  Data(
      {this.counter,
      this.isMemory,
      this.sId,
      this.word,
      this.translation,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    counter = json['counter'];
    isMemory = json['isMemory'];
    sId = json['_id'];
    word = json['word'];
    translation = json['translation'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
