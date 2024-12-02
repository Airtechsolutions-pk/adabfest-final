import '../../../core/app_export.dart';

/// This class is used in the [ourpartnersgrid_item_widget] screen.

class OurpartnersgridItemModel {
  List<Partner>? partner;
  String? description;
  int? status;

  OurpartnersgridItemModel({this.partner, this.description, this.status});

  OurpartnersgridItemModel.fromJson(Map<String, dynamic> json) {
    if (json['partner'] != null) {
      partner = <Partner>[];
      json['partner'].forEach((v) {
        partner!.add(new Partner.fromJson(v));
      });
    }
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.partner != null) {
      data['partner'] = this.partner!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class Partner {
  int? partnerID;
  String? name;
  String? link;
  String? image;
  int? statusID;
  String? createdon;
  Null? updatedBy;

  Partner(
      {this.partnerID,
        this.name,
        this.image,
        this.link,
        this.statusID,
        this.createdon,
        this.updatedBy});

  Partner.fromJson(Map<String, dynamic> json) {
    partnerID = json['partnerID'];
    name = json['name'];
    image = json['image'];
    link = json['link'];

    statusID = json['statusID'];
    createdon = json['createdon'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partnerID'] = this.partnerID;
    data['name'] = this.name;
    data['link'] = this.link;

    data['image'] = this.image;
    data['statusID'] = this.statusID;
    data['createdon'] = this.createdon;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}