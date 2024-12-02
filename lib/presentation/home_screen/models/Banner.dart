class MainBanner {
  List<Banners>? banners;
  String? description;
  int? status;

  MainBanner({this.banners, this.description, this.status});

  MainBanner.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      banners = <Banners>[];
      json['banner'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banner'] = this.banners!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class Banners {
  int? bannerID;
  String? type;
  String? screen;
  String? title;
  String? description;
  String? image;
  int? displayOrder;
  int? statusID;
  String? createdon;
  String? updatedon;
  String? updatedBy;

  Banners(
      {this.bannerID,
        this.type,
        this.screen,
        this.title,
        this.description,
        this.image,
        this.displayOrder,
        this.statusID,
        this.createdon,
        this.updatedon,
        this.updatedBy});

  Banners.fromJson(Map<String, dynamic> json) {
    bannerID = json['bannerID'];
    type = json['type'];
    screen = json['screen'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    displayOrder = json['displayOrder'];
    statusID = json['statusID'];
    createdon = json['createdon'];
    updatedon = json['updatedon'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bannerID'] = this.bannerID;
    data['type'] = this.type;
    data['screen'] = this.screen;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['displayOrder'] = this.displayOrder;
    data['statusID'] = this.statusID;
    data['createdon'] = this.createdon;
    data['updatedon'] = this.updatedon;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}