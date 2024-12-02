import '../../../core/app_export.dart';

class PostPostCustomerSignupResp {
  Attendees? attendees;
  String? description;
  String? status;

  PostPostCustomerSignupResp({this.attendees, this.description, this.status});

  PostPostCustomerSignupResp.fromJson(Map<String, dynamic> json) {
    attendees = json['attendees'] != null
        ? new Attendees.fromJson(json['attendees'])
        : null;
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendees != null) {
      data['attendees'] = this.attendees!.toJson();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class Attendees {

  String? fullName;
  String? email;
  String? phoneNo;

  Attendees(
      {
        this.fullName,
        this.email,
        this.phoneNo,
    });

  Attendees.fromJson(Map<String, dynamic> json) {

    fullName = json['fullName'];
    email = json['email'];
    phoneNo = json['phoneNo'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;


    return data;
  }
}


