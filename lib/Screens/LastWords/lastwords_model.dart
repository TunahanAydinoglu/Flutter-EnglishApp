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
