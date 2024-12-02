class forgetModel {
  String? status;
  String? email;
  String? password;

  forgetModel({this.status, this.email, this.password});

  forgetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
