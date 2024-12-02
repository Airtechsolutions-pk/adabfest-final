class Message {
  List<Messages>? message;
  String? description;
  int? status;

  Message({this.message, this.description, this.status});

  Message.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <Messages>[];
      json['message'].forEach((v) {
        message!.add(new Messages.fromJson(v));
      });
    }
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class Messages {
  int? messageID;
  String? name;
  String? designation;
  String? image;
  String? description;
  int? statusID;
  String? createdon;
  String? updatedon;

  Messages(
      {this.messageID,
        this.name,
        this.designation,
        this.image,
        this.description,
        this.statusID,
        this.createdon,
        this.updatedon});

  Messages.fromJson(Map<String, dynamic> json) {
    messageID = json['messageID'];
    name = json['name'];
    designation = json['designation'];
    image = json['image'];
    description = json['description'];
    statusID = json['statusID'];
    createdon = json['createdon'];
    updatedon = json['updatedon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageID'] = this.messageID;
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['image'] = this.image;
    data['description'] = this.description;
    data['statusID'] = this.statusID;
    data['createdon'] = this.createdon;
    data['updatedon'] = this.updatedon;
    return data;
  }
}