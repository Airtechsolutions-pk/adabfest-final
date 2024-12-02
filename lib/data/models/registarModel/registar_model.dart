class RegistarModel {
  int? attendeesID;
  int? eventID;
  int? userID;
  String? fullName;
  String? email;
  String? phoneNo;
  String? occupation;
  String? gender;
  int? statusID;
  String? createdon;

  RegistarModel(
      {this.attendeesID,
        this.eventID,
        this.userID,
        this.fullName,
        this.email,
        this.phoneNo,
        this.occupation,
        this.gender,
        this.statusID,
        this.createdon});

  RegistarModel.fromJson(Map<String, dynamic> json) {
    attendeesID = json['attendeesID'];
    eventID = json['eventID'];
    userID = json['userID'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    occupation = json['occupation'];
    gender = json['gender'];
    statusID = json['statusID'];
    createdon = json['createdon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendeesID'] = this.attendeesID;
    data['eventID'] = this.eventID;
    data['userID'] = this.userID;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    data['occupation'] = this.occupation;
    data['gender'] = this.gender;
    data['statusID'] = this.statusID;
    data['createdon'] = this.createdon;
    return data;
  }
}