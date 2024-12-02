class WorkshopModel {
  List<Workshop>? workshop;
  String? description;
  int? status;

  WorkshopModel({this.workshop, this.description, this.status});

  WorkshopModel.fromJson(Map<String, dynamic> json) {
    if (json['workshop'] != null) {
      workshop = <Workshop>[];
      json['workshop'].forEach((v) {
        workshop!.add(new Workshop.fromJson(v));
      });
    }
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.workshop != null) {
      data['workshop'] = this.workshop!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class Workshop {
  int? workshopID;
  String? organizerName;
  String? name;
  String? description;
  String? date;
  String? image;
  String? finalDate;
  String? link;

  String? startTime;
  String? endTime;
  String? pdfLink;
  int? statusID;
  String? createdon;
  String? updatedon;
  String? updatedby;

  Workshop(
      {this.workshopID,
        this.organizerName,
        this.name,
        this.description,
        this.date,
        this.image,
        this.startTime,
        this.finalDate,
        this.link,
        this.endTime,
        this.pdfLink,
        this.statusID,
        this.createdon,
        this.updatedon,
        this.updatedby});

  Workshop.fromJson(Map<String, dynamic> json) {
    workshopID = json['workshopID'];
    organizerName = json['organizerName'];
    name = json['name'];
    description = json['description'];
    date = json['date'];
    image = json['image'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    link = json['link'];
    finalDate = json['finalDate'];

    pdfLink = json['pdfLink'];
    statusID = json['statusID'];
    createdon = json['createdon'];
    updatedon = json['updatedon'];
    updatedby = json['updatedby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['workshopID'] = this.workshopID;
    data['organizerName'] = this.organizerName;
    data['name'] = this.name;
    data['description'] = this.description;
    data['date'] = this.date;
    data['image'] = this.image;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['pdfLink'] = this.pdfLink;
    data['statusID'] = this.statusID;
    data['finalDate'] = this.finalDate;
    data['link'] = this.link;

    data['createdon'] = this.createdon;
    data['updatedon'] = this.updatedon;
    data['updatedby'] = this.updatedby;
    return data;
  }
}