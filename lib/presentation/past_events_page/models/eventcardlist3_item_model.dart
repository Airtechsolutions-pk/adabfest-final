import '../../../core/app_export.dart';

/// This class is used in the [eventcardlist3_item_widget] screen.
class Eventcardlist3ItemModel {
  Eventcardlist3ItemModel({
    this.eventDate,
    this.eventTime,
    this.eventName,
    this.id,
  }) {
    eventDate = eventDate ?? ImageConstant.imgRectangle;
    eventTime = eventTime ?? "10 June •\r9:00 AM";
    eventName = eventName ?? "Event Name Here Event Name Here Event Name...";
    id = id ?? "";
  }

  String? eventDate;

  String? eventTime;

  String? eventName;

  String? id;
}
