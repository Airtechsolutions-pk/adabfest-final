class MyEvent {
  Event? event;
  String? status;
  String? description;

  MyEvent({this.event, this.status, this.description});

  MyEvent.fromJson(Map<String, dynamic> json) {
    print("Mapping MyEvent with json: $json");
    event = json['qr'] != null ? Event.fromJson(json['qr']) : null;
    status = json['status']?.toString();
    description = json['description']?.toString();
    print("Mapped event userName: ${event?.userName}");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (event != null) {
      data['qr'] = event!.toJson(); // Use 'qr' to match the API structure
    }
    data['status'] = status;
    data['description'] = description;
    return data;
  }
}

class Event {
  int? userID;
  String? userName;
  String? contactNo;
  String? createdDate;
  String? finalDate;

  Event({
    this.userID,
    this.userName,
    this.contactNo,
    this.createdDate,
    this.finalDate,
  });

  Event.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    contactNo = json['contactNo'];
    createdDate = json['createdDate'];
    finalDate = json['finalDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['userName'] = userName;
    data['contactNo'] = contactNo;
    data['createdDate'] = createdDate;
    data['finalDate'] = finalDate;
    return data;
  }
}


