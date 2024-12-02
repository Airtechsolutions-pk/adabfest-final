import 'dart:async';
import 'dart:convert';

import 'package:adabfest/data/models/registarModel/registar_model.dart';
import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/registration_screen/models/registration_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repository/repository.dart';
import '../../e_pass_downlaod_two_screen/provider/e_pass_downlaod_two_provider.dart';

/// A provider class for the RegistrationScreen.
///
/// This provider manages the state of the RegistrationScreen, including the
/// current registrationModelObj

// ignore_for_file: must_be_immutable
class RegistrationProvider extends ChangeNotifier {
  String? fullNameSectionController;

  String? emailSectionController;
  List<String> radioList = ["male", "female"];

  String? phoneSectionController;

  String? passwordSectionController;
  static const String userIdKey = 'userId';
  String? confirmPasswordSectionController;
  TextEditingController occupationValueEditTextSectionController =
  TextEditingController();
  var postPostCustomerSignupResp = <RegistarModel>[];

  bool isShowPassword = true;

  bool isShowPassword1 = true;

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userIdKey);
  }


  String genderRadioGroupSection = "";

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void changePasswordVisibility1() {
    isShowPassword1 = !isShowPassword1;
    notifyListeners();
  }
  final _repository = Repository();

  void changeRadioButton1(String value) {
    genderRadioGroupSection = value;
    notifyListeners();
  }

  FutureOr<void> callPostCustomerSignup({
    Function? onSuccess,
    Function? onError,
    int? uid,
    int? eventid,
  }) async {
    var postPostCustomerSignupReq = RegistarModel(
         userID: uid,
          eventID: eventid,
          fullName: fullNameSectionController.toString(),
          email: emailSectionController.toString(),
         phoneNo: phoneSectionController.toString(),
         occupation: occupationValueEditTextSectionController.text,
      gender: genderRadioGroupSection,
      statusID: 1,


    );

    await _repository.postRegistration(
      headers: {},
      requestData: postPostCustomerSignupReq.toJson(),
    ).then((value) async {
      // Assuming postCustomerSignup returns a single PostPostCustomerSignupResp
      RegistarModel response = value;



      onSuccess?.call();
      notifyListeners();
    }).onError((error, stackTrace) {
      // implement error call
      _onPostCustomerSignupError();
    });
  }



  void _onPostCustomerSignupSuccess(RegistarModel resp) {

  }
  void _onPostCustomerSignupError() {
      Fluttertoast.showToast(msg: "Already Exist",backgroundColor: Colors.red.shade600,textColor: Colors.white,fontSize: 18.fSize);
  }
}
