import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/past_events_empty_page/models/past_events_empty_model.dart';

/// A provider class for the PastEventsEmptyPage.
///
/// This provider manages the state of the PastEventsEmptyPage, including the
/// current pastEventsEmptyModelObj
class PastEventsEmptyProvider extends ChangeNotifier {
  PastEventsEmptyModel pastEventsEmptyModelObj = PastEventsEmptyModel();

  @override
  void dispose() {
    super.dispose();
  }
}
