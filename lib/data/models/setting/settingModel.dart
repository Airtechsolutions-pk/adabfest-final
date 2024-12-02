class SettingModel {
  Setting? setting;
  String? description;
  int? status;

  SettingModel({this.setting, this.description, this.status});

  SettingModel.fromJson(Map<String, dynamic> json) {
    setting =
    json['setting'] != null ? new Setting.fromJson(json['setting']) : null;
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.setting != null) {
      data['setting'] = this.setting!.toJson();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class Setting {
  int? settingID;
  String? about;
  String? privacyPolicy;
  String? splashScreen;
  String? pdfUrl;

  String? appName;
  String? appVersion;
  String? facebookUrl;
  String? instagramUrl;
  String? twitterUrl;
  String? youtubeUrl;
  int? statusID;
  String? createdon;
  String? updatedon;
  List<Faqs>? faqs;
  List<Popup>? popup;
  Chair? chair;
  ChairConference? chairConference;

  Setting(
      {this.settingID,
        this.about,
        this.privacyPolicy,
        this.splashScreen,
        this.pdfUrl,
        this.appName,
        this.appVersion,
        this.facebookUrl,
        this.instagramUrl,
        this.twitterUrl,
        this.youtubeUrl,
        this.statusID,
        this.createdon,
        this.updatedon,
        this.faqs,
        this.popup,
        this.chair,
        this.chairConference});

  Setting.fromJson(Map<String, dynamic> json) {
    settingID = json['settingID'];
    about = json['about'];
    privacyPolicy = json['privacyPolicy'];
    splashScreen = json['splashScreen'];
    appName = json['appName'];
    pdfUrl = json['pdfUrl'];

    appVersion = json['appVersion'];
    facebookUrl = json['facebookUrl'];
    instagramUrl = json['instagramUrl'];
    twitterUrl = json['twitterUrl'];
    youtubeUrl = json['youtubeUrl'];
    statusID = json['statusID'];
    createdon = json['createdon'];
    updatedon = json['updatedon'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }
    if (json['popup'] != null) {
      popup = <Popup>[];
      json['popup'].forEach((v) {
        popup!.add(new Popup.fromJson(v));
      });
    }
    chair = json['chair'] != null ? new Chair.fromJson(json['chair']) : null;
    chairConference = json['chairConference'] != null
        ? new ChairConference.fromJson(json['chairConference'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['settingID'] = this.settingID;
    data['about'] = this.about;
    data['privacyPolicy'] = this.privacyPolicy;
    data['splashScreen'] = this.splashScreen;
    data['appName'] = this.appName;
    data['appVersion'] = this.appVersion;
    data['pdfUrl'] = this.pdfUrl;

    data['facebookUrl'] = this.facebookUrl;
    data['instagramUrl'] = this.instagramUrl;
    data['twitterUrl'] = this.twitterUrl;
    data['youtubeUrl'] = this.youtubeUrl;
    data['statusID'] = this.statusID;
    data['createdon'] = this.createdon;
    data['updatedon'] = this.updatedon;
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
    }
    if (this.popup != null) {
      data['popup'] = this.popup!.map((v) => v.toJson()).toList();
    }
    if (this.chair != null) {
      data['chair'] = this.chair!.toJson();
    }
    if (this.chairConference != null) {
      data['chairConference'] = this.chairConference!.toJson();
    }
    return data;
  }
}

class Faqs {
  int? faqID;
  String? faqQ;
  String? faqA;
  int? statusID;
  String? createdon;

  Faqs({this.faqID, this.faqQ, this.faqA, this.statusID, this.createdon});

  Faqs.fromJson(Map<String, dynamic> json) {
    faqID = json['faqID'];
    faqQ = json['faqQ'];
    faqA = json['faqA'];
    statusID = json['statusID'];
    createdon = json['createdon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['faqID'] = this.faqID;
    data['faqQ'] = this.faqQ;
    data['faqA'] = this.faqA;
    data['statusID'] = this.statusID;
    data['createdon'] = this.createdon;
    return data;
  }
}

class Popup {
  int? id;
  String? name;
  String? image;
  int? displayOrder;
  int? statusID;
  String? createdon;
  String? updatedon;

  Popup(
      {this.id,
        this.name,
        this.image,
        this.displayOrder,
        this.statusID,
        this.createdon,
        this.updatedon});

  Popup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    displayOrder = json['displayOrder'];
    statusID = json['statusID'];
    createdon = json['createdon'];
    updatedon = json['updatedon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['displayOrder'] = this.displayOrder;
    data['statusID'] = this.statusID;
    data['createdon'] = this.createdon;
    data['updatedon'] = this.updatedon;
    return data;
  }
}

class Chair {
  Null? msgChair;
  String? imgChair;

  Chair({this.msgChair, this.imgChair});

  Chair.fromJson(Map<String, dynamic> json) {
    msgChair = json['msgChair'];
    imgChair = json['imgChair'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msgChair'] = this.msgChair;
    data['imgChair'] = this.imgChair;
    return data;
  }
}

class ChairConference {
  String? msgConferenceChair;
  String? imgConChair;

  ChairConference({this.msgConferenceChair, this.imgConChair});

  ChairConference.fromJson(Map<String, dynamic> json) {
    msgConferenceChair = json['msgConferenceChair'];
    imgConChair = json['imgConChair'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msgConferenceChair'] = this.msgConferenceChair;
    data['imgConChair'] = this.imgConChair;
    return data;
  }
}


