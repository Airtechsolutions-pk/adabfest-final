class PostPostCustomerSignupReq1 {
  String? userID;
  String? userName;
  String? email;
  String? image;
  String? address;
  String? contactNo;
  String? password;
  String? statusID;
  String? createdDate;
  String? updatedDate;
  String? updatedBy;

  PostPostCustomerSignupReq1(
      {this.userID,
      this.userName,
      this.email,
      this.image,
      this.address,
      this.contactNo,
      this.password,
      this.statusID,
      this.createdDate,
      this.updatedDate,
      this.updatedBy});

  PostPostCustomerSignupReq1.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    email = json['email'];
    image = json['image'];
    address = json['address'];
    contactNo = json['contactNo'];
    password = json['password'];
    statusID = json['statusID'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (userID != null) {
      data['userID'] = userID;
    }
    if (userName != null) {
      data['userName'] = userName;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (image != null) {
      data['image'] = image;
    }
    if (address != null) {
      data['address'] = address;
    }
    if (contactNo != null) {
      data['contactNo'] = contactNo;
    }
    if (password != null) {
      data['password'] = password;
    }
    if (statusID != null) {
      data['statusID'] = statusID;
    }
    if (createdDate != null) {
      data['createdDate'] = createdDate;
    }
    if (updatedDate != null) {
      data['updatedDate'] = updatedDate;
    }
    if (updatedBy != null) {
      data['updatedBy'] = updatedBy;
    }
    return data;
  }
}
