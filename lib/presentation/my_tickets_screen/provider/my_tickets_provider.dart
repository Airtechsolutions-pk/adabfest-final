import 'dart:async';

import 'package:adabfest/data/models/myevents/myevents.dart';
import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/my_tickets_screen/models/my_tickets_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repository/repository.dart';
import '../models/eventcard3_item_model.dart';
import '../models/my_tickets_model.dart';

/// A provider class for the MyTicketsScreen.
///
/// This provider manages the state of the MyTicketsScreen, including the
/// current myTicketsModelObj

// ignore_for_file: must_be_immutable
class MyTicketsProvider extends ChangeNotifier {
  MyTicketsModel myTicketsModelObj = MyTicketsModel();

  var getqr = <MyEvent>[];

  final _repository = Repository();
  static const String userIdKey = 'userId';
  @override
  void dispose() {
    super.dispose();
  }

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userIdKey);
  }
  bool? isLoad = false;

  Future<void> calluserapi({
    Function? onSuccess,
    Function? onError,
    int? userid,
  }) async {
    await _repository.getbyeventid(userid!).then((value) {
      getqr = value;
      print("First item in getqr: ${getqr[0].event?.userName}");
      onSuccess?.call();
      notifyListeners(); // Ensure this is called to update the UI
    }).onError((error, stackTrace) {
      _onGetCustomerLoginUrlError1();
      onError?.call();
    });
  }

  void _onGetCustomerLoginUrlSuccess(List<MyEvent> resp) {

  }
  void _onGetCustomerLoginUrlError1() {

  }

}
