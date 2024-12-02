import 'dart:async';

import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/faqs_screen/models/faqs_model.dart';
import '../../../data/models/setting/settingModel.dart';
import '../../../data/repository/repository.dart';

/// A provider class for the FaqsScreen.
///
/// This provider manages the state of the FaqsScreen, including the
/// current faqsModelObj

// ignore_for_file: must_be_immutable
class FaqsProvider extends ChangeNotifier {

  @override
  void dispose() {
    super.dispose();
  }

  var getsetting = <SettingModel>[];
  final _repository = Repository();


  Future<List<SettingModel>> callspeakerApi({
    Function? onSuccess,
    Function? onError,
  }) async {
    try {
      List<SettingModel> value = await _repository.setting();
      getsetting = value;
      _onGetCustomerLoginUrlSuccess1(value);
      onSuccess?.call();
      notifyListeners();
      return value;
    } catch (error) {
      // implement error handling
      _onGetCustomerLoginUrlError();
      onError?.call();
      // Throw an exception to indicate the failure
      throw Exception('Error fetching data: $error');
    }
  }
  void _onGetCustomerLoginUrlSuccess1(List<SettingModel> resp) {

  }
  void _onGetCustomerLoginUrlError() {

  }

}
