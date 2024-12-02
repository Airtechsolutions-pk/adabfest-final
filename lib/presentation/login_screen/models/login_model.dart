import '../../../core/app_export.dart';
class GetGetCustomerLoginUrlResp {
  int? userID;
  String? description;
  int? status;

  GetGetCustomerLoginUrlResp({this.userID, this.description, this.status});

  GetGetCustomerLoginUrlResp.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;

    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class Login {
  int? userID;
  String? userName;
  String? email;
  String? image;
  String? address;
  String? contactNo;
  String? password;
  int? statusID;
  String? createdDate;
  String? updatedDate;
  String? meetingLink;
  int? updatedBy;

  Login(
      {this.userID,
        this.userName,
        this.email,
        this.image,
        this.address,
        this.contactNo,
        this.password,
        this.statusID,
        this.createdDate,
        this.meetingLink,
        this.updatedDate,
        this.updatedBy});

  Login.fromJson(Map<String, dynamic> json) {
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
    meetingLink = json['meetingLink'];

    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['image'] = this.image;
    data['address'] = this.address;
    data['contactNo'] = this.contactNo;
    data['password'] = this.password;
    data['statusID'] = this.statusID;
    data['createdDate'] = this.createdDate;
    data['meetingLink'] = this.meetingLink;

    data['updatedDate'] = this.updatedDate;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}