import 'dart:async';

import 'package:adabfest/data/models/setting/settingModel.dart';
import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/splash_screen/models/splash_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/repository/repository.dart';

/// A provider class for the SplashScreen.
///
/// This provider manages the state of the SplashScreen, including the
/// current splashModelObj

// ignore_for_file: must_be_immutable
class SplashProvider extends ChangeNotifier {
  var getsetting = <SettingModel>[];
  final _repository = Repository();
   String? imageUrl; // Add imageUrl variable
  final _apiClient = ApiClient();

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
    if (resp.isNotEmpty && resp[0].setting != null) {
      imageUrl = resp[0].setting!.splashScreen ?? '';
    }
  }
  void _onGetCustomerLoginUrlError() {

  }




}
