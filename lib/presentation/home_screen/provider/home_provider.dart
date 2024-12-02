import 'dart:async';

import 'package:adabfest/data/models/GlobalEvents/EventsModals.dart';
import 'package:adabfest/data/models/messagemodel/MessageModel.dart';
import 'package:adabfest/data/models/speakermodel/speaker_model.dart';
import 'package:adabfest/data/models/workshopModel/workShopmodel.dart';
import 'package:adabfest/presentation/home_screen/models/Banner.dart';
import 'package:flutter/material.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repository/repository.dart';

/// A provider class for the HomeScreen.
///
/// This provider manages the state of the HomeScreen, including the
/// current homeModelObj

// ignore_for_file: must_be_immutable
class HomeProvider extends ChangeNotifier {
  final _repository = Repository();

  var getbannerRepo = <MainBanner>[];
  var getspeakerRepo = <SpeakersListModel>[];
  var messageApi = <Message>[];
  var workshoprepo = <WorkshopModel>[];

  var getevents = <EventsModels>[];

  @override
  void dispose() {
    super.dispose();
  }


  Future<String?> getPdfUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('pdfUrl');
  }

  FutureOr<void> calltoken()async {
    return await _repository.token();

  }
  FutureOr<void> callworkshop({
    Function? onSuccess,
    Function? onError,

  }) async {
    await _repository.workshopApi().then((value) async {
      workshoprepo = value;
      _onGetCustomerLoginUrlSuccessW(value);
      onSuccess?.call();
      notifyListeners();





    }).onError((error, stackTrace) {
      //implement error call
      _onGetCustomerLoginUrlErrorw();
      onError?.call();
    });
  }
  FutureOr<void> callevents({
    Function? onSuccess,
    Function? onError,

  }) async {
    await _repository.events().then((value) async {
      getevents = value;
      _onGetCustomerLoginUrlSuccessEVENTS(value);
        onSuccess?.call();
        notifyListeners();





    }).onError((error, stackTrace) {
      //implement error call
      _onGetCustomerLoginUrlError();
      onError?.call();
    });
  }
  FutureOr<void> callbannerapi({
    Function? onSuccess,
    Function? onError,

  }) async {
    await _repository.bannerApi().then((value) async {
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


  FutureOr<void> callspeakerApi({
    Function? onSuccess,
    Function? onError,

  }) async {
    await _repository.SpeakersApiHome().then((value) async {
      getspeakerRepo = value;
      _onGetCustomerLoginUrlSuccess1(value);
      onSuccess?.call();
      notifyListeners();





    }).onError((error, stackTrace) {
      //implement error call
      _onGetCustomerLoginUrlError();
      onError?.call();
    });
  }


  FutureOr<void> callmessage({
    Function? onSuccess,
    Function? onError,

  }) async {
    await _repository.msgApi().then((value) async {
      messageApi = value;
      _message(value);
      onSuccess?.call();
      notifyListeners();





    }).onError((error, stackTrace) {
      //implement error call
      _onGetCustomerLoginUrlError();
      onError?.call();
    });
  }

  void _message(List<Message> resp) {
  }
  void _messageerror() {

  }
  void _onGetCustomerLoginUrlSuccess1(List<SpeakersListModel> resp) {
  }
  void _onGetCustomerLoginUrlError1() {

  }
  void _onGetCustomerLoginUrlSuccessEVENTS(List<EventsModels> resp) {
  }
  void _onGetCustomerLoginUrlErrorEvents() {

  }
  void _onGetCustomerLoginUrlSuccess(List<MainBanner> resp) {
  }
  void _onGetCustomerLoginUrlError() {

  }

  void _onGetCustomerLoginUrlSuccessW(List<WorkshopModel> resp) {
  }
  void _onGetCustomerLoginUrlErrorw() {

  }









}
