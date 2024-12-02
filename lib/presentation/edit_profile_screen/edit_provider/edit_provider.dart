import 'dart:async';

import 'package:adabfest/data/models/GetUserModel/getuser_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repository/repository.dart';
import '../../sign_up_screen/models/sign_up_model.dart';

class EditProfileProvider extends ChangeNotifier {
  String? signUpFullNameController;

  String? signUpEmailController;

  String? signUpPhoneController;

  String? signUpPasswordController;
  static const String userIdKey = 'userId';

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userIdKey);
  }

  bool isShowPassword = true;

  bool isShowPassword1 = true;

  final _repository = Repository();

  var postPostCustomerSignupResp = <User>[];


  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void changePasswordVisibility1() {
    isShowPassword1 = !isShowPassword1;
    notifyListeners();
  }

  FutureOr<void> callPostCustomerSignup({
    Function? onSuccess,
    Function? onError,
    int? uid,
    String? name,
    String? phone,
    String? password,
  }) async {

    var postPostCustomerSignupReq = User(
        userName: signUpFullNameController?.isNotEmpty ?? false ? signUpFullNameController : name,
        contactNo: signUpPhoneController?.isNotEmpty ?? false ? signUpPhoneController : phone,
        password: signUpPasswordController?.isNotEmpty ?? false ? signUpPasswordController : password,

        attendeesID: uid
    );


    await _repository.posteditcustomer(
      headers: {},
      requestData: postPostCustomerSignupReq.toJson(),
    ).then((value) async {
      // Assuming postCustomerSignup returns a single PostPostCustomerSignupResp
      User response = value;
      print("response ${response}");

      // Access the properties of the response as needed

      onSuccess?.call();
      notifyListeners();
    }).onError((error, stackTrace) {
      // implement error call
      _onPostCustomerSignupError();
    });
  }

  void _onPostCustomerSignupSuccess(User resp) {}
  void _onPostCustomerSignupError() {
    //implement error method body...
  }



}
