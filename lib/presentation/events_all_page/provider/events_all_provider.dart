import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/events_all_page/models/events_all_model.dart';
import '../models/eventcard3_item_model.dart';

/// A provider class for the EventsAllPage.
///
/// This provider manages the state of the EventsAllPage, including the
/// current eventsAllModelObj

// ignore_for_file: must_be_immutable
class EventsAllProvider extends ChangeNotifier {
  EventsAllModel eventsAllModelObj = EventsAllModel();

  @override
  void dispose() {
    super.dispose();
  }
}
