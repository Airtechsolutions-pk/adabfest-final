class OrganizationCom {
  List<OrganisingCommittee>? organisingCommittee;
  String? description;
  int? status;

  OrganizationCom({this.organisingCommittee, this.description, this.status});

  OrganizationCom.fromJson(Map<String, dynamic> json) {
    if (json['organisingCommittee'] != null) {
      organisingCommittee = <OrganisingCommittee>[];
      json['organisingCommittee'].forEach((v) {
        organisingCommittee!.add(new OrganisingCommittee.fromJson(v));
      });
    }
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.organisingCommittee != null) {
      data['organisingCommittee'] =
          this.organisingCommittee!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class OrganisingCommittee {
  int? id;
  String? name;
  String? designation;
  String? image;
  int? statusID;
  String? createdon;
  String? updatedon;
  String? updatedby;

  OrganisingCommittee(
      {this.id,
        this.name,
        this.designation,
        this.image,
        this.statusID,
        this.createdon,
        this.updatedon,
        this.updatedby});

  OrganisingCommittee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    designation = json['designation'];
    image = json['image'];
    statusID = json['statusID'];
    createdon = json['createdon'];
    updatedon = json['updatedon'];
    updatedby = json['updatedby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['image'] = this.image;
    data['statusID'] = this.statusID;
    data['createdon'] = this.createdon;
    data['updatedon'] = this.updatedon;
    data['updatedby'] = this.updatedby;
    return data;
  }
}