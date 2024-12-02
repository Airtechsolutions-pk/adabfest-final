class GetUser {
  User? user;
  String? status;
  String? description;

  GetUser({this.user, this.status, this.description});

  GetUser.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}

class User {
  int? attendeesID;
  String? userName;
  String? email;
  String? image;
  String? address;
  String? contactNo;
  String? password;
  int? statusID;
  String? createdDate;
  String? updatedDate;
  int? updatedBy;

  User(
      {this.attendeesID,
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

  User.fromJson(Map<String, dynamic> json) {
    attendeesID = json['attendeesID'];
    userName = json['fullName'];
    email = json['email'];
    image = json['image'];
    address = json['address'];
    contactNo = json['phoneNo'];
    password = json['password'];
    statusID = json['statusID'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendeesID'] = this.attendeesID;
    data['fullName'] = this.userName;
    data['email'] = this.email;
    data['image'] = this.image;
    data['address'] = this.address;
    data['phoneNo'] = this.contactNo;
    data['password'] = this.password;
    data['statusID'] = this.statusID;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}