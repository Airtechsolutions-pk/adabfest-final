import 'dart:async';

import 'package:adabfest/data/models/GetUserModel/getuser_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/forgetresponsemodel.dart';
import '../../../data/repository/repository.dart';
import '../../sign_up_screen/models/sign_up_model.dart';

class forgetPasswordProvider extends ChangeNotifier {

  String? signUpEmailController;




  final _repository = Repository();

  var postPostCustomerSignupResp = <forgetModel>[];





  FutureOr<void> calluserapi({
    Function? onSuccess,
    Function? onError,
    String? email,

  }) async {
    await _repository.forgettcustomer(email!).then((value) async {

      postPostCustomerSignupResp = value;

      print("---->> ${postPostCustomerSignupResp.length}");

      if(value[0].status == "1"){
        onSuccess?.call();

        notifyListeners();
      }else if(value[0].status == "0") {
        onError?.call();

      }





    }).onError((error, stackTrace) {
      //implement error call
      _onGetCustomerLoginUrlError1();
      onError?.call();
    });
  }

  void _onGetCustomerLoginUrlSuccess(List resp) {

  }
  void _onGetCustomerLoginUrlError1() {

  }



}
