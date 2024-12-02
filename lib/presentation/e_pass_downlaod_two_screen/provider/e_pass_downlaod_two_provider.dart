import 'dart:async';

import 'package:adabfest/data/models/registarModel/registar_model.dart';
import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/e_pass_downlaod_two_screen/models/e_pass_downlaod_two_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/QRLogin/Qr_login.dart';
import '../../../data/repository/repository.dart';

/// A provider class for the EPassDownlaodTwoScreen.
///
/// This provider manages the state of the EPassDownlaodTwoScreen, including the
/// current ePassDownlaodTwoModelObj
class EPassDownlaodTwoProvider extends ChangeNotifier {
  var getqr = <QRLogin>[];

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

  FutureOr<void> calluserapi({
    Function? onSuccess,
    Function? onError,
    int? uid,

  }) async {
    print("----???? ${uid}");
    await _repository.getqrbyid(uid!).then((value) async {
      getqr = value;
      _onGetCustomerLoginUrlSuccess(value);
      onSuccess?.call();
      notifyListeners();




    }).onError((error, stackTrace) {
      //implement error call
      _onGetCustomerLoginUrlError1();
      onError?.call();
    });
  }

  void _onGetCustomerLoginUrlSuccess(List<QRLogin> resp) {

  }
  void _onGetCustomerLoginUrlError1() {

  }
}

