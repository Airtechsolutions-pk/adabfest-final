// class EventsModels {
//   List<Eventcategories>? eventcategories;
//   String? description;
//   int? status;
//
//   EventsModels({this.eventcategories, this.description, this.status});
//
//   EventsModels.fromJson(Map<String, dynamic> json) {
//     if (json['eventcategories'] != null) {
//       eventcategories = <Eventcategories>[];
//       json['eventcategories'].forEach((v) {
//         eventcategories!.add(new Eventcategories.fromJson(v));
//       });
//     }
//     description = json['description'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.eventcategories != null) {
//       data['eventcategories'] =
//           this.eventcategories!.map((v) => v.toJson()).toList();
//     }
//     data['description'] = this.description;
//     data['status'] = this.status;
//     return data;
//   }
// }
//
// class Eventcategories {
//   int? eventCategoryID;
//   String? name;
//   String? description;
//   int? statusID;
//   String? image;
//   String? createdon;
//   String? updatedon;
//   String? updatedBy;
//   List<Events>? events;
//
//   Eventcategories(
//       {this.eventCategoryID,
//         this.name,
//         this.description,
//         this.statusID,
//         this.image,
//         this.createdon,
//         this.updatedon,
//         this.updatedBy,
//         this.events});
//
//   Eventcategories.fromJson(Map<String, dynamic> json) {
//     eventCategoryID = json['eventCategoryID'];
//     name = json['name'];
//     description = json['description'];
//     statusID = json['statusID'];
//     image = json['image'];
//     createdon = json['createdon'];
//     updatedon = json['updatedon'];
//     updatedBy = json['updatedBy'];
//     if (json['events'] != null) {
//       events = <Events>[];
//       json['events'].forEach((v) {
//         events!.add(new Events.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['eventCategoryID'] = this.eventCategoryID;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['statusID'] = this.statusID;
//     data['image'] = this.image;
//     data['createdon'] = this.createdon;
//     data['updatedon'] = this.updatedon;
//     data['updatedBy'] = this.updatedBy;
//     if (this.events != null) {
//       data['events'] = this.events!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Events {
//   int? eventID;
//   int? eventCategoryID;
//   int? organizerID;
//   int? attendeesID;
//   String? name;
//   String? type;
//   String? description;
//   bool? isFeatured;
//   String? location;
//   String? fromDate;
//   String? toDate;
//   String? ticketNormal;
//   String? ticketPremium;
//   String? ticketPlatinum;
//   String? eventDate;
//   String? eventTime;
//   String? eventCity;
//   String? locationLink;
//   int? statusID;
//   String? doorTime;
//   String? phoneNo;
//   String? email;
//   int? remainingTicket;
//   int? eventAttendeesID;
//   String? facebook;
//   String? instagram;
//   String? twitter;
//   String? image;
//   String? createdon;
//   String? updatedon;
//   String? updatedBy;
//   List<Speakers>? speakers;
//   List<Organizers>? organizers;
//
//   Events(
//       {this.eventID,
//         this.eventCategoryID,
//         this.organizerID,
//         this.attendeesID,
//         this.name,
//         this.type,
//         this.description,
//         this.isFeatured,
//         this.location,
//         this.fromDate,
//         this.toDate,
//         this.ticketNormal,
//         this.ticketPremium,
//         this.ticketPlatinum,
//         this.eventDate,
//         this.eventTime,
//         this.eventCity,
//         this.locationLink,
//         this.statusID,
//         this.doorTime,
//         this.phoneNo,
//         this.email,
//         this.remainingTicket,
//         this.eventAttendeesID,
//         this.facebook,
//         this.instagram,
//         this.twitter,
//         this.image,
//         this.createdon,
//         this.updatedon,
//         this.updatedBy,
//         this.speakers,
//         this.organizers});
//
//   Events.fromJson(Map<String, dynamic> json) {
//     eventID = json['eventID'];
//     eventCategoryID = json['eventCategoryID'];
//     organizerID = json['organizerID'];
//     attendeesID = json['attendeesID'];
//     name = json['name'];
//     type = json['type'];
//     description = json['description'];
//     isFeatured = json['isFeatured'];
//     location = json['location'];
//     fromDate = json['fromDate'];
//     toDate = json['toDate'];
//     ticketNormal = json['ticketNormal'];
//     ticketPremium = json['ticketPremium'];
//     ticketPlatinum = json['ticketPlatinum'];
//     eventDate = json['eventDate'];
//     eventTime = json['eventTime'];
//     eventCity = json['eventCity'];
//     locationLink = json['locationLink'];
//     statusID = json['statusID'];
//     doorTime = json['doorTime'];
//     phoneNo = json['phoneNo'];
//     email = json['email'];
//     remainingTicket = json['remainingTicket'];
//     eventAttendeesID = json['eventAttendeesID'];
//     facebook = json['facebook'];
//     instagram = json['instagram'];
//     twitter = json['twitter'];
//     image = json['image'];
//     createdon = json['createdon'];
//     updatedon = json['updatedon'];
//     updatedBy = json['updatedBy'];
//     if (json['speakers'] != null) {
//       speakers = <Speakers>[];
//       json['speakers'].forEach((v) {
//         speakers!.add(new Speakers.fromJson(v));
//       });
//     }
//     if (json['organizers'] != null) {
//       organizers = <Organizers>[];
//       json['organizers'].forEach((v) {
//         organizers!.add(new Organizers.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['eventID'] = this.eventID;
//     data['eventCategoryID'] = this.eventCategoryID;
//     data['organizerID'] = this.organizerID;
//     data['attendeesID'] = this.attendeesID;
//     data['name'] = this.name;
//     data['type'] = this.type;
//     data['description'] = this.description;
//     data['isFeatured'] = this.isFeatured;
//     data['location'] = this.location;
//     data['fromDate'] = this.fromDate;
//     data['tooDate'] = this.toDate;
//     data['ticketNormal'] = this.ticketNormal;
//     data['ticketPremium'] = this.ticketPremium;
//     data['ticketPlatinum'] = this.ticketPlatinum;
//     data['eventDate'] = this.eventDate;
//     data['eventTime'] = this.eventTime;
//     data['eventCity'] = this.eventCity;
//     data['locationLink'] = this.locationLink;
//     data['statusID'] = this.statusID;
//     data['doorTime'] = this.doorTime;
//     data['phoneNo'] = this.phoneNo;
//     data['email'] = this.email;
//     data['remainingTicket'] = this.remainingTicket;
//     data['eventAttendeesID'] = this.eventAttendeesID;
//     data['facebook'] = this.facebook;
//     data['instagram'] = this.instagram;
//     data['twitter'] = this.twitter;
//     data['image'] = this.image;
//     data['createdon'] = this.createdon;
//     data['updatedon'] = this.updatedon;
//     data['updatedBy'] = this.updatedBy;
//     if (this.speakers != null) {
//       data['speakers'] = this.speakers!.map((v) => v.toJson()).toList();
//     }
//     if (this.organizers != null) {
//       data['organizers'] = this.organizers!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Speakers {
//   int? eventID;
//   int? speakerID;
//   String? name;
//   String? designation;
//   String? company;
//   String? about;
//   String? image;
//   int? statusID;
//   String? createdon;
//   String? updatedon;
//   String? updatedBy;
//
//   Speakers(
//       {this.eventID,
//         this.speakerID,
//         this.name,
//         this.designation,
//         this.company,
//         this.about,
//         this.image,
//         this.statusID,
//         this.createdon,
//         this.updatedon,
//         this.updatedBy});
//
//   Speakers.fromJson(Map<String, dynamic> json) {
//     eventID = json['eventID'];
//     speakerID = json['speakerID'];
//     name = json['name'];
//     designation = json['designation'];
//     company = json['company'];
//     about = json['about'];
//     image = json['image'];
//     statusID = json['statusID'];
//     createdon = json['createdon'];
//     updatedon = json['updatedon'];
//     updatedBy = json['updatedBy'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['eventID'] = this.eventID;
//     data['speakerID'] = this.speakerID;
//     data['name'] = this.name;
//     data['designation'] = this.designation;
//     data['company'] = this.company;
//     data['about'] = this.about;
//     data['image'] = this.image;
//     data['statusID'] = this.statusID;
//     data['createdon'] = this.createdon;
//     data['updatedon'] = this.updatedon;
//     data['updatedBy'] = this.updatedBy;
//     return data;
//   }
// }
//
// class Organizers {
//   int? eventID;
//   int? organizerID;
//   String? name;
//   String? description;
//   String? image;
//   int? statusID;
//   String? createdon;
//   String? updatedon;
//   String? updatedBy;
//
//   Organizers(
//       {this.eventID,
//         this.organizerID,
//         this.name,
//         this.description,
//         this.image,
//         this.statusID,
//         this.createdon,
//         this.updatedon,
//         this.updatedBy});
//
//   Organizers.fromJson(Map<String, dynamic> json) {
//     eventID = json['eventID'];
//     organizerID = json['organizerID'];
//     name = json['name'];
//     description = json['description'];
//     image = json['image'];
//     statusID = json['statusID'];
//     createdon = json['createdon'];
//     updatedon = json['updatedon'];
//     updatedBy = json['updatedBy'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['eventID'] = this.eventID;
//     data['organizerID'] = this.organizerID;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['image'] = this.image;
//     data['statusID'] = this.statusID;
//     data['createdon'] = this.createdon;
//     data['updatedon'] = this.updatedon;
//     data['updatedBy'] = this.updatedBy;
//     return data;
//   }
// }


class EventsModels {
  List<Eventcategories>? eventcategories;
  String? description;
  int? status;

  EventsModels({this.eventcategories, this.description, this.status});

  EventsModels.fromJson(Map<String, dynamic> json) {
    if (json['eventcategories'] != null) {
      eventcategories = <Eventcategories>[];
      json['eventcategories'].forEach((v) {
        eventcategories!.add(new Eventcategories.fromJson(v));
      });
    }
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eventcategories != null) {
      data['eventcategories'] =
          this.eventcategories!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class Eventcategories {
  int? eventCategoryID;
  String? name;
  String? description;
  int? statusID;
  String? image;
  String? createdon;
  String? updatedon;
  String? updatedBy;
  List<Events>? events;

  Eventcategories(
      {this.eventCategoryID,
        this.name,
        this.description,
        this.statusID,
        this.image,
        this.createdon,
        this.updatedon,
        this.updatedBy,
        this.events});

  Eventcategories.fromJson(Map<String, dynamic> json) {
    eventCategoryID = json['eventCategoryID'];
    name = json['name'];
    description = json['description'];
    statusID = json['statusID'];
    image = json['image'];
    createdon = json['createdon'];
    updatedon = json['updatedon'];
    updatedBy = json['updatedBy'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventCategoryID'] = this.eventCategoryID;
    data['name'] = this.name;
    data['description'] = this.description;
    data['statusID'] = this.statusID;
    data['image'] = this.image;
    data['createdon'] = this.createdon;
    data['updatedon'] = this.updatedon;
    data['updatedBy'] = this.updatedBy;
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  int? eventID;
  int? eventCategoryID;
  int? organizerID;
  int? attendeesID;
  String? name;
  String? type;
  String? description;
  bool? isFeatured;
  String? location;
  String? fromDate;
  String? toDate;
  String? ticketNormal;
  String? ticketPremium;
  String? ticketPlatinum;
  String? eventDate;
  String? eventTime;
  String? eventCity;
  String? eventEndTime;

  String? locationLink;
  int? statusID;
  String? doorTime;
  String? phoneNo;
  String? email;
  int? remainingTicket;
  int? eventAttendeesID;
  String? facebook;
  String? instagram;
  String? twitter;
  String? image;
  String? createdon;
  String? updatedon;
  String? updatedBy;
  List<ImgList>? imgList;
  List<Speakers>? speakers;
  List<Organizers>? organizers;

  Events(
      {this.eventID,
        this.eventCategoryID,
        this.organizerID,
        this.attendeesID,
        this.name,
        this.type,
        this.description,
        this.isFeatured,
        this.location,
        this.fromDate,
        this.toDate,
        this.ticketNormal,
        this.ticketPremium,
        this.ticketPlatinum,
        this.eventDate,
        this.eventTime,
        this.eventEndTime,
        this.eventCity,
        this.locationLink,
        this.statusID,
        this.doorTime,
        this.phoneNo,
        this.email,
        this.remainingTicket,
        this.eventAttendeesID,
        this.facebook,
        this.instagram,
        this.twitter,
        this.image,
        this.createdon,
        this.updatedon,
        this.updatedBy,
        this.imgList,
        this.speakers,
        this.organizers});

  Events.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    eventCategoryID = json['eventCategoryID'];
    organizerID = json['organizerID'];
    attendeesID = json['attendeesID'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    isFeatured = json['isFeatured'];
    location = json['location'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    ticketNormal = json['ticketNormal'];
    ticketPremium = json['ticketPremium'];
    ticketPlatinum = json['ticketPlatinum'];
    eventDate = json['eventDate'];
    eventTime = json['eventTime'];
    eventCity = json['eventCity'];

    eventEndTime = json['eventEndTime'];

    locationLink = json['locationLink'];
    statusID = json['statusID'];
    doorTime = json['doorTime'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    remainingTicket = json['remainingTicket'];
    eventAttendeesID = json['eventAttendeesID'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    image = json['image'];
    createdon = json['createdon'];
    updatedon = json['updatedon'];
    updatedBy = json['updatedBy'];
    if (json['imgList'] != null) {
      imgList = <ImgList>[];
      json['imgList'].forEach((v) {
        imgList!.add(new ImgList.fromJson(v));
      });
    }
    if (json['speakers'] != null) {
      speakers = <Speakers>[];
      json['speakers'].forEach((v) {
        speakers!.add(new Speakers.fromJson(v));
      });
    }
    if (json['organizers'] != null) {
      organizers = <Organizers>[];
      json['organizers'].forEach((v) {
        organizers!.add(new Organizers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['eventCategoryID'] = this.eventCategoryID;
    data['organizerID'] = this.organizerID;
    data['attendeesID'] = this.attendeesID;
    data['name'] = this.name;
    data['type'] = this.type;
    data['description'] = this.description;
    data['isFeatured'] = this.isFeatured;
    data['location'] = this.location;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['ticketNormal'] = this.ticketNormal;
    data['ticketPremium'] = this.ticketPremium;
    data['ticketPlatinum'] = this.ticketPlatinum;
    data['eventDate'] = this.eventDate;
    data['eventTime'] = this.eventTime;

    data['eventEndTime'] = this.eventEndTime;

    data['eventCity'] = this.eventCity;
    data['locationLink'] = this.locationLink;
    data['statusID'] = this.statusID;
    data['doorTime'] = this.doorTime;
    data['phoneNo'] = this.phoneNo;
    data['email'] = this.email;
    data['remainingTicket'] = this.remainingTicket;
    data['eventAttendeesID'] = this.eventAttendeesID;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['image'] = this.image;
    data['createdon'] = this.createdon;
    data['updatedon'] = this.updatedon;
    data['updatedBy'] = this.updatedBy;
    if (this.imgList != null) {
      data['imgList'] = this.imgList!.map((v) => v.toJson()).toList();
    }
    if (this.speakers != null) {
      data['speakers'] = this.speakers!.map((v) => v.toJson()).toList();
    }
    if (this.organizers != null) {
      data['organizers'] = this.organizers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImgList {
  int? eventID;
  String? image;

  ImgList({this.eventID, this.image});

  ImgList.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['image'] = this.image;
    return data;
  }
}

class Speakers {
  int? eventID;
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

  Speakers(
      {this.eventID,
        this.speakerID,
        this.name,
        this.designation,
        this.company,
        this.about,
        this.image,
        this.statusID,
        this.createdon,
        this.updatedon,
        this.updatedBy});

  Speakers.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
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
    data['eventID'] = this.eventID;
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

class Organizers {
  int? eventID;
  int? organizerID;
  String? name;
  String? description;
  String? image;
  int? statusID;
  String? createdon;
  String? updatedon;
  String? updatedBy;

  Organizers(
      {this.eventID,
        this.organizerID,
        this.name,
        this.description,
        this.image,
        this.statusID,
        this.createdon,
        this.updatedon,
        this.updatedBy});

  Organizers.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    organizerID = json['organizerID'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    statusID = json['statusID'];
    createdon = json['createdon'];
    updatedon = json['updatedon'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['organizerID'] = this.organizerID;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['statusID'] = this.statusID;
    data['createdon'] = this.createdon;
    data['updatedon'] = this.updatedon;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}