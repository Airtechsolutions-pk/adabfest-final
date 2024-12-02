import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/privacy_policy_screen/models/privacy_policy_model.dart';

/// A provider class for the PrivacyPolicyScreen.
///
/// This provider manages the state of the PrivacyPolicyScreen, including the
/// current privacyPolicyModelObj

// ignore_for_file: must_be_immutable
class PrivacyPolicyProvider extends ChangeNotifier {
  PrivacyPolicyModel privacyPolicyModelObj = PrivacyPolicyModel();

  @override
  void dispose() {
    super.dispose();
  }
}
