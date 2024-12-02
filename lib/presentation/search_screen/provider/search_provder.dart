// ignore_for_file: must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';

import '../../../data/models/GlobalEvents/EventsModals.dart';
import '../../../data/repository/repository.dart';

class SearchProvider extends ChangeNotifier {
  final _repository = Repository();

  var getevents = <EventsModels>[];

  @override
  void dispose() {
    super.dispose();
  }

  FutureOr<void> callevents({
    Function? onSuccess,
    Function? onError,
  }) async {
    await _repository.events().then((value) async {
      getevents = value;
      _onGetCustomerLoginUrlSuccessEVENTS(value);
      onSuccess?.call();
      notifyListeners();
    }).onError((error, stackTrace) {
      //implement error call
      // _onGetCustomerLoginUrlError();
      onError?.call();
    });
  }

  void _onGetCustomerLoginUrlSuccessEVENTS(List<EventsModels> resp) {}
  void _onGetCustomerLoginUrlErrorEvents() {}
}
