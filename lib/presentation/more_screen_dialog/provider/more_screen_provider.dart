import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/more_screen_dialog/models/more_screen_model.dart';

/// A provider class for the MoreScreenDialog.
///
/// This provider manages the state of the MoreScreenDialog, including the
/// current moreScreenModelObj
class MoreScreenProvider extends ChangeNotifier {
  MoreScreenModel moreScreenModelObj = MoreScreenModel();

  @override
  void dispose() {
    super.dispose();
  }
}
