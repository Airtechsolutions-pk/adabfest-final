class QRLogin {
  Qr? qr;
  String? status;
  String? description;

  QRLogin({this.qr, this.status, this.description});

  QRLogin.fromJson(Map<String, dynamic> json) {
    qr = json['qr'] != null ? new Qr.fromJson(json['qr']) : null;
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.qr != null) {
      data['qr'] = this.qr!.toJson();
    }
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}

class Qr {
  int? eventID;
  int? eventUserID;
  String? eventName;
  String? email;
  String? fullName;

  String? phoneNo;
  String? fromDate;
  String? toDate;
  String? finalDate;

  Qr(
      {this.eventID,
        this.eventName,
        this.eventUserID,
        this.email,
        this.fullName,
        this.phoneNo,
        this.fromDate,
        this.toDate,
        this.finalDate});

  Qr.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    eventUserID = json['eventUserID'];

    eventName = json['eventName'];
    email = json['email'];
    fullName = json['fullName'];
    phoneNo = json['phoneNo'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    finalDate = json['finalDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['eventName'] = this.eventName;
    data['eventUserID'] = this.eventUserID;

    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['phoneNo'] = this.phoneNo;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['finalDate'] = this.finalDate;
    return data;
  }
}