import '../../../core/app_export.dart';

/// This class is used in the [eventdetails_item_widget] screen.
class EventdetailsItemModel {
  EventdetailsItemModel({
    this.eventName,
    this.bookmarkIcon,
    this.eventName1,
    this.eventTime,
    this.viewDetailsText,
    this.id, required String userIcon,
  }) {
    eventName = eventName ?? ImageConstant.imgAiBiotech2;
    bookmarkIcon = bookmarkIcon ?? ImageConstant.imgBookmark;
    eventName1 = eventName1 ?? "Event Name Here";
    eventTime = eventTime ?? "4, March, 2024 - 5:00Pm";
    viewDetailsText = viewDetailsText ?? "View Details";
    id = id ?? "";
  }

  String? eventName;

  String? bookmarkIcon;

  String? eventName1;

  String? eventTime;

  String? viewDetailsText;

  String? id;
}
