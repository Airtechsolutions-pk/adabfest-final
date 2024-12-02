class PostPostCustomerSignupResp {
  int? userId;
  String? status;
  String? description;

  PostPostCustomerSignupResp({this.userId, this.status, this.description});

  PostPostCustomerSignupResp.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (userId != null) {
      data['userId'] = userId;
    }
    if (status != null) {
      data['status'] = status;
    }
    if (description != null) {
      data['description'] = description;
    }
    return data;
  }
}
