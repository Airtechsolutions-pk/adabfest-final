
class SpeakersListModel {
  List<Speaker>? speaker;
  String? description;
  int? status;

  SpeakersListModel({this.speaker, this.description, this.status});

  SpeakersListModel.fromJson(Map<String, dynamic> json) {
    if (json['speaker'] != null) {
      speaker = <Speaker>[];
      json['speaker'].forEach((v) {
        speaker!.add(new Speaker.fromJson(v));
      });
    }
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.speaker != null) {
      data['speaker'] = this.speaker!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class Speaker {
  int? speakerID;
  String? name;
  String? designation;
  String? company;
  String? about;
  String? image;
  int? statusID;
  String? createdon;
  String? updatedon;
  String? updatedBy;

  Speaker(
      {this.speakerID,
        this.name,
        this.designation,
        this.company,
        this.about,
        this.image,
        this.statusID,
        this.createdon,
        this.updatedon,
        this.updatedBy});

  Speaker.fromJson(Map<String, dynamic> json) {
    speakerID = json['speakerID'];
    name = json['name'];
    designation = json['designation'];
    company = json['company'];
    about = json['about'];
    image = json['image'];
    statusID = json['statusID'];
    createdon = json['createdon'];
    updatedon = json['updatedon'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speakerID'] = this.speakerID;
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['company'] = this.company;
    data['about'] = this.about;
    data['image'] = this.image;
    data['statusID'] = this.statusID;
    data['createdon'] = this.createdon;
    data['updatedon'] = this.updatedon;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}