import 'dart:async';

import 'package:adabfest/data/models/GetUserModel/getuser_model.dart';
import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/more_screen/models/more_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/setting/settingModel.dart';
import '../../../data/repository/repository.dart';

/// A provider class for the MoreScreen.
///
/// This provider manages the state of the MoreScreen, including the
/// current moreModelObj
class MoreProvider extends ChangeNotifier {
  var getsetting = <SettingModel>[];
  var getuser = <GetUser>[];

  final _repository = Repository();
  String? imageUrl; // Add imageUrl variable
  static const String userIdKey = 'userId';

  @override
  void dispose() {
    super.dispose();
  }

  FutureOr<void> callspeakerApi({
    Function? onSuccess,
    Function? onError,

  }) async {
    await _repository.setting().then((value) async {
      getsetting = value;
      _onGetCustomerLoginUrlSuccess1(value);
      onSuccess?.call();
      notifyListeners();




    }).onError((error, stackTrace) {
      //implement error call
      _onGetCustomerLoginUrlError();
      onError?.call();
    });
  }

  void _onGetCustomerLoginUrlSuccess1(List<SettingModel> resp) {

  }
  void _onGetCustomerLoginUrlError() {

  }

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userIdKey);
  }

  FutureOr<void> calluserapi({
    Function? onSuccess,
    Function? onError,
    int? uid,

  }) async {
    await _repository.getuserbyid(uid!).then((value) async {
      getuser = value;
      _onGetCustomerLoginUrlSuccess(value);
      onSuccess?.call();
      notifyListeners();




    }).onError((error, stackTrace) {
      //implement error call
      _onGetCustomerLoginUrlError1();
      onError?.call();
    });
  }

  void _onGetCustomerLoginUrlSuccess(List<GetUser> resp) {

  }
  void _onGetCustomerLoginUrlError1() {

  }

}
