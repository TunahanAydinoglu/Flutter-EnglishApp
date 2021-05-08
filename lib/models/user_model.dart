class User {
  String id;
  String name;
  String email;
  String role;
  String profileImage;
  int isShowCount;
  int userLastWordCount;
  bool isShowMemory;
  bool blocked;

  User(
      {this.id,
      this.name,
      this.email,
      this.role,
      this.profileImage,
      this.userLastWordCount,
      this.isShowCount,
      this.isShowMemory,
      this.blocked});

  User.fromJson(Map<String, dynamic> json) {
    name = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    profileImage = json['profileImage'];
    userLastWordCount = json['userLastWordCount'];
    isShowCount = json['isShowCount'];
    isShowMemory = json['isShowMemory'];
    blocked = json['blocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['profileImage'] = this.profileImage;
    data['userLastWordCount'] = this.userLastWordCount;
    data['isShowCount'] = this.isShowCount;
    data['isShowMemory'] = this.isShowMemory;
    data['blocked'] = this.blocked;
    return data;
  }
}
