import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/congratulation_dialog/models/congratulation_model.dart';

/// A provider class for the CongratulationDialog.
///
/// This provider manages the state of the CongratulationDialog, including the
/// current congratulationModelObj

// ignore_for_file: must_be_immutable
class CongratulationProvider extends ChangeNotifier {
  CongratulationModel congratulationModelObj = CongratulationModel();

  @override
  void dispose() {
    super.dispose();
  }
}
