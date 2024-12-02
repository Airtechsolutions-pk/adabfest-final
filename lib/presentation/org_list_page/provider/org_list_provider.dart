import 'dart:async';

import 'package:adabfest/data/models/speakermodel/speaker_model.dart';
import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';

import '../../../data/models/orgCommte/organizatiomModel.dart';
import '../../../data/repository/repository.dart';

/// A provider class for the SpeakersListPage.
///
/// This provider manages the state of the SpeakersListPage, including the
/// current speakersListModelObj

// ignore_for_file: must_be_immutable
class OrgListPageListProvider extends ChangeNotifier {

  final _repository = Repository();

  var getspeakerRepo = <OrganizationCom>[];
  @override
  void dispose() {
    super.dispose();
  }

  FutureOr<void> callbannerapi({
    Function? onSuccess,
    Function? onError,

  }) async {
    await _repository.orgCom().then((value) async {
      getspeakerRepo = value;
      _onGetCustomerLoginUrlSuccess(value);
      onSuccess?.call();
      notifyListeners();





    }).onError((error, stackTrace) {
      //implement error call
      _onGetCustomerLoginUrlError();
      onError?.call();
    });
  }

  void _onGetCustomerLoginUrlSuccess(List<OrganizationCom> resp) {
  }
  void _onGetCustomerLoginUrlError() {

  }



}
