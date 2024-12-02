import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/past_events_page/models/past_events_model.dart';
import '../models/eventcardlist3_item_model.dart';

/// A provider class for the PastEventsPage.
///
/// This provider manages the state of the PastEventsPage, including the
/// current pastEventsModelObj

// ignore_for_file: must_be_immutable
class PastEventsProvider extends ChangeNotifier {
  PastEventsModel pastEventsModelObj = PastEventsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
