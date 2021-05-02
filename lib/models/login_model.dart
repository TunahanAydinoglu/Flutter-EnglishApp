class LoginModel {
  String email;
  String password;

  LoginModel({this.email, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class LoginUserModel {
  String name;
  String email;
  String role;
  String token;

  LoginUserModel({this.name, this.email, this.role, this.token});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}
