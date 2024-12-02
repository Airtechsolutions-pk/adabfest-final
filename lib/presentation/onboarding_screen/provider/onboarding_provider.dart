import 'dart:async';

import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/onboarding_screen/models/onboarding_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repository/repository.dart';
import '../../login_screen/models/login_model.dart';

/// A provider class for the OnboardingScreen.
///
/// This provider manages the state of the OnboardingScreen, including the
/// current onboardingModelObj

// ignore_for_file: must_be_immutable
class OnboardingProvider extends ChangeNotifier {
  OnboardingModel onboardingModelObj = OnboardingModel();
  static const String loggedInKey = 'isLoggedIn';
  static const String userIdKey = 'userId';
  int? userId;


  @override
  void dispose() {
    super.dispose();
  }


}
