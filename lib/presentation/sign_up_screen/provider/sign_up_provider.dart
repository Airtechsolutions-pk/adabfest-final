import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../../../data/repository/repository.dart';
import '../../login_screen/models/login_model.dart';

/// A provider class for the SignUpScreen.
///
/// This provider manages the state of the SignUpScreen, including the
/// current signUpModelObj

// ignore_for_file: must_be_immutable
class SignUpProvider extends ChangeNotifier {
  String? emailController;

  String? passwordController;
  String? username;
  String? password;


  bool isShowPassword = true;

  final _repository = Repository();

  var getGetCustomerLoginUrlResp = <GetGetCustomerLoginUrlResp>[];
  static const String loggedInKey = 'isLoggedIn';
  static const String userIdKey = 'userId';
  int? userId;

  Future<void> saveUserId(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(userIdKey, userId);
  }

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userIdKey);
  }


  Future<void> saveLoggedInStatus(bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loggedInKey, isLoggedIn);

  }

  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedInKey) ?? false;
  }


  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  FutureOr<void> callGetCustomerLoginUrl({
    Function? onSuccess,
    Function? onError,
    required String emailController,
    required String passwordController,
  }) async {
    print("tahir digital ${emailController.toString()}");

    await _repository.getCustomerLoginUrl(emailController.toString(), passwordController.toString())
        .then((value) async {
      if (value.isNotEmpty) {  // Ensure the list is not empty
        print("value ${value[0].userID}");
        if (value[0].status == 200) {
          // Make sure userId is valid before calling saveUserId
          var userId = value[0].userID;
          print("user id $userId");
          if (userId != null) {
            await saveLoggedInStatus(true); // Save login status
            await saveUserId(userId); // Save user ID
            onSuccess?.call();
            notifyListeners();
          } else {
            Fluttertoast.showToast(
              msg: "User ID is null",
              backgroundColor: Colors.red.shade600,
              fontSize: 18.0,
              textColor: Colors.white,
              gravity: ToastGravity.TOP,
            );
          }
        } else {
          onError?.call();
          Fluttertoast.showToast(
            msg: value[0].description ?? "Unknown error",
            backgroundColor: Colors.red.shade600,
            fontSize: 18.0,
            textColor: Colors.white,
            gravity: ToastGravity.TOP,
          );
        }
      } else {
        // Handle empty response list case
        onError?.call();
        Fluttertoast.showToast(
          msg: "No data received from server.",
          backgroundColor: Colors.red.shade600,
          fontSize: 18.0,
          textColor: Colors.white,
          gravity: ToastGravity.TOP,
        );
      }
    }).onError((error, stackTrace) {
      // Handle error
      print("Error: $error");
      onError?.call();
      Fluttertoast.showToast(
        msg: "An error occurred: $error",
        backgroundColor: Colors.red.shade600,
        fontSize: 18.0,
        textColor: Colors.white,
        gravity: ToastGravity.TOP,
      );
    });
  }


  void _onGetCustomerLoginUrlSuccess(List<GetGetCustomerLoginUrlResp> resp) {
  }
  void _onGetCustomerLoginUrlError(List<GetGetCustomerLoginUrlResp> resp) {
    Fluttertoast.showToast(msg: "${resp[0].description}",backgroundColor: Colors.red.shade600,fontSize: 18.fSize,textColor: Colors.white,gravity: ToastGravity.TOP, );

  }


  FutureOr<void> callGetCustomerGoogleUrl({
    Function? onSuccess,
    Function? onError,
    String? googleemail,
  }) async {
    await _repository.getgoogleSing(googleemail.toString()
    ).then((value) async {
      getGetCustomerLoginUrlResp = value;
      _onGetCustomerLoginUrlSuccess(value);
      if(getGetCustomerLoginUrlResp[0].status != 0){
        onSuccess?.call();
        await saveLoggedInStatus(true); // Save login status
        userId = getGetCustomerLoginUrlResp[0].userID;

        await saveUserId(userId!); // Save user ID
        notifyListeners();

      }else{
        //_onGetCustomerLoginUrlError();
        onError?.call();
      }




    }).onError((error, stackTrace) {
      //implement error call
      //_onGetCustomerLoginUrlError();
      onError?.call();
    });
  }

  FutureOr<void> getapple({
    Function? onSuccess,
    Function? onError,
    String? googleemail,
  }) async {
    await _repository.getapple(googleemail.toString()
    ).then((value) async {
      getGetCustomerLoginUrlResp = value;
      _onGetCustomerLoginUrlSuccess(value);
      if(getGetCustomerLoginUrlResp[0].status != 0){
        onSuccess?.call();
        await saveLoggedInStatus(true); // Save login status
        userId = getGetCustomerLoginUrlResp[0].userID;

        await saveUserId(userId!); // Save user ID
        notifyListeners();

      }else{
        //  _onGetCustomerLoginUrlError();
        onError?.call();
      }




    }).onError((error, stackTrace) {
      //implement error call
      //   _onGetCustomerLoginUrlError();
      onError?.call();
    });
  }

}
