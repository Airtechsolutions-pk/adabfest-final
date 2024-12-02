import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/payment_screenshot_upload_screen/models/payment_screenshot_upload_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A provider class for the PaymentScreenshotUploadScreen.
///
/// This provider manages the state of the PaymentScreenshotUploadScreen, including the
/// current paymentScreenshotUploadModelObj

// ignore_for_file: must_be_immutable
class PaymentScreenshotUploadProvider extends ChangeNotifier {
  PaymentScreenshotUploadModel paymentScreenshotUploadModelObj =
      PaymentScreenshotUploadModel();
  static const String userIdKey = 'userId';

  @override
  void dispose() {
    super.dispose();
  }

  Future<int?> getUserId() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getInt(userIdKey);
  }

}
