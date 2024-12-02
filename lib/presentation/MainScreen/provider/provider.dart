
import 'dart:async';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/setting/settingModel.dart';
import '../../../data/repository/repository.dart';
import '../model/main_model.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Main_ScreenNotifier extends ChangeNotifier {
  var getsetting = <SettingModel>[];
  final _repository = Repository();
  String? imageUrl; // Add imageUrl variable
  final _apiClient = ApiClient();
  String? pdfurl; // Add pdf variable

  @override
  void dispose() {
    super.dispose();
  }

  // Method to save pdfurl locally using SharedPreferences
  Future<void> savePdfUrl(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('pdfUrl', url);
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
      _onGetCustomerLoginUrlError();
      onError?.call();
    });
  }

  void _onGetCustomerLoginUrlSuccess1(List<SettingModel> resp) async {
    if (resp.isNotEmpty && resp[0].setting != null) {
      imageUrl = resp[0].setting!.popup?[0].image ?? '';
      pdfurl = resp[0].setting!.pdfUrl ?? '';

      // Save pdfurl locally when the API call succeeds
      if (pdfurl != null && pdfurl!.isNotEmpty) {
        await savePdfUrl(pdfurl!);
      }

      print("pdf url is here$pdfurl");
    }
  }

  void _onGetCustomerLoginUrlError() {
    // Handle the error case if needed
  }
}
