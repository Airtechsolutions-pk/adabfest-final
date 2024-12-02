import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/e_pass_downlaod_screen/models/e_pass_downlaod_model.dart';

/// A provider class for the EPassDownlaodScreen.
///
/// This provider manages the state of the EPassDownlaodScreen, including the
/// current ePassDownlaodModelObj
class EPassDownlaodProvider extends ChangeNotifier {
  EPassDownlaodModel ePassDownlaodModelObj = EPassDownlaodModel();

  @override
  void dispose() {
    super.dispose();
  }
}
