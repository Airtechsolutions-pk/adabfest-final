import '../../../core/app_export.dart';

/// This class is used in the [listsection_item_widget] screen.
class ListsectionItemModel {
  ListsectionItemModel({
    this.eventImage,
    this.eventTime,
    this.eventName,
    this.id,
  }) {
    eventImage = eventImage ?? ImageConstant.imgRectangle;
    eventTime = eventTime ?? "10 June •\r9:00 AM";
    eventName = eventName ?? "Event Name Here Event Name Here Event Name...";
    id = id ?? "";
  }

  String? eventImage;

  String? eventTime;

  String? eventName;

  String? id;
}