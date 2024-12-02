import 'dart:async';

import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/past_events_tab_container_page/models/past_events_tab_container_model.dart';
import 'package:intl/intl.dart';

import '../../../data/models/GlobalEvents/EventsModals.dart';
import '../../../data/repository/repository.dart';

/// A provider class for the PastEventsTabContainerPage.
///
/// This provider manages the state of the PastEventsTabContainerPage, including the
/// current pastEventsTabContainerModelObj
class PastEventsTabContainerProvider extends ChangeNotifier {
  PastEventsTabContainerModel pastEventsTabContainerModelObj =
      PastEventsTabContainerModel();
  final _repository = Repository();

  // var pastEvents = <EventsModels>[];
  // var upcomingEvents = <EventsModels>[];
  var pastEvents = [];
  var upcomingEvents = [];

  bool? isfilter = true;

  List<Eventcategories> allCategories = [];

  // Add this line to toggle category selection
  List<Eventcategories> selectedCategories = [];

  Future<void> applyFilters() async {
    print("Selected Categories: ${selectedCategories.length}");
    isfilter = false;

    DateFormat format = DateFormat("MM-dd-yyyy");
    // Clear the lists before applying filters

    DateTime now = DateTime.now();
    pastEvents = selectedCategories
        .where((event) => event.events!
            .any((category) => format.parse(category.fromDate!).isBefore(now)))
        .toList();
    upcomingEvents = selectedCategories
        .where((event) => event.events!
            .any((category) => format.parse(category.fromDate!).isAfter(now)))
        .toList();

    print("Past Events after filters: ${pastEvents!.length}");
    print("Upcoming Events after filters: ${upcomingEvents.length}");

    notifyListeners();
  }

  Future<void> callevents({
    Function? onSuccess,
    Function? onError,
  }) async {
    try {
      List<EventsModels> allEvents = await _repository.events();
      // Clear the lists before populating events
      pastEvents = [];
      upcomingEvents = [];

      DateTime now = DateTime.now();

      print("Now: $now");

      allEvents.forEach((event) {
        event.eventcategories!.forEach((category) {
          allCategories.add(category);

          category.events!.forEach((innerEvent) {
            try {
              DateTime eventDate =
                  DateFormat('dd-MM-yyyy').parse(innerEvent.fromDate!);

              if (eventDate.isBefore(now)) {
                pastEvents.add(innerEvent);
              } else {
                upcomingEvents.add(innerEvent);
              }
            } catch (e) {
              print('Error parsing date: ${innerEvent.fromDate}');
            }
          });
        });
      });

      print("Past Events: ${pastEvents.length}");
      print("Upcoming Events: ${upcomingEvents.length}");

      _onGetCustomerLoginUrlSuccessEVENTS(allEvents);
      onSuccess?.call();
      notifyListeners();
    } catch (error, stackTrace) {
      print("Error: $error");
      print("Stack Trace: $stackTrace");
      _onGetCustomerLoginUrlError();
      onError?.call();
    }
  }

  void _onGetCustomerLoginUrlSuccessEVENTS(List<EventsModels> resp) {}
  void _onGetCustomerLoginUrlError() {}
  @override
  void dispose() {
    super.dispose();
  }
}
