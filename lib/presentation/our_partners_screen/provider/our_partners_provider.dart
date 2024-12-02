import 'dart:async';

import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import '../../../data/repository/repository.dart';
import '../models/ourpartnersgrid_item_model.dart';

/// A provider class for the OurPartnersScreen.
///
/// This provider manages the state of the OurPartnersScreen, including the
/// current ourPartnersModelObj

// ignore_for_file: must_be_immutable
class OurPartnersProvider extends ChangeNotifier {
  final _repository = Repository();

  var getbannerRepo = <OurpartnersgridItemModel>[];
  @override
  void dispose() {
    super.dispose();
  }

  FutureOr<void> callbannerapi({
    Function? onSuccess,
    Function? onError,

  }) async {
    await _repository.partnerApi().then((value) async {
      getbannerRepo = value;
      _onGetCustomerLoginUrlSuccess(value);
      onSuccess?.call();
      notifyListeners();





    }).onError((error, stackTrace) {
      //implement error call
      _onGetCustomerLoginUrlError();
      onError?.call();
    });
  }

  void _onGetCustomerLoginUrlSuccess(List<OurpartnersgridItemModel> resp) {
  }
  void _onGetCustomerLoginUrlError() {

  }


}
