import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/admin_login_one_screen/models/admin_login_one_model.dart';

/// A provider class for the AdminLoginOneScreen.
///
/// This provider manages the state of the AdminLoginOneScreen, including the
/// current adminLoginOneModelObj
// class AdminLoginOneProvider extends ChangeNotifier {
//   TextEditingController otpController = TextEditingController();
//
//   AdminLoginOneModel adminLoginOneModelObj = AdminLoginOneModel();
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
class AdminLoginOneProvider extends ChangeNotifier {
  TextEditingController otpController = TextEditingController();
  Dio dio = Dio();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Future<bool> validateAndCallApi() async {
    try {
      String apiUrl = "http://adabfest-001-site1.gtempurl.com/Login/LoginWithPasscode/${otpController.text.toString()}";

      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        // Parse the response
        final responseData = response.data;
        if (responseData["status"] == 200) {
          // API request was successful and login is successful
          // You can also parse and store the user information if needed
          // e.g., User.fromJson(responseData["loginAdmin"])
          return true;
        } else {
          // API request was successful, but login failed
          print("Login failed. Description: ${responseData["description"]}");
          return false;
        }
      } else {
        // API request failed
        print("API request failed. Status code: ${response.statusCode}");
        return false;
      }
    } catch (error) {
      // Handle any exceptions or errors that occur during the API call
      print("API call error: $error");
      return false;
    }
  }
}
