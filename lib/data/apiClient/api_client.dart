import 'dart:convert';

import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/core/utils/progress_dialog_utils.dart';
import 'package:adabfest/data/models/GlobalEvents/EventsModals.dart';
import 'package:adabfest/data/models/getCustomerLoginUrl/get_get_customer_login_url_resp.dart';
import 'package:adabfest/data/models/messagemodel/MessageModel.dart';
import 'package:adabfest/data/models/myevents/myevents.dart';
import 'package:adabfest/data/models/registarModel/registar_model.dart';
import 'package:adabfest/data/models/setting/settingModel.dart';
import 'package:adabfest/data/models/speakermodel/speaker_model.dart';
import 'package:adabfest/data/models/workshopModel/workShopmodel.dart';
import 'package:adabfest/presentation/events_all_page/models/events_all_model.dart';
import 'package:adabfest/presentation/home_screen/models/Banner.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/errors/exceptions.dart';
import '../../core/network/network_info.dart';
import '../../presentation/login_screen/models/login_model.dart';
import '../../presentation/our_partners_screen/models/ourpartnersgrid_item_model.dart';
import '../../presentation/sign_up_screen/models/sign_up_model.dart';
import '../models/GetUserModel/getuser_model.dart';
import '../models/QRLogin/Qr_login.dart';
import '../models/forgetresponsemodel.dart';
import '../models/orgCommte/organizatiomModel.dart';
import 'network_interceptor.dart';

class ApiClient {
  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  var url = "http://adabfest-001-site1.gtempurl.com/";

  static final ApiClient _apiClient = ApiClient._internal();

  final _dio =
      Dio(BaseOptions(connectTimeout: const Duration(seconds: 60), headers: {
    "Content-Type": "application/json",
  }))
        ..interceptors.add(NetworkInterceptor());

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await NetworkInfo().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    if (response.statusCode != null) {
      return response.statusCode! >= 200 && response.statusCode! <= 299;
    } else if (response.statusCode == 404) {
      throw 'Resource not found';
    }
    return false;
  }

  /// Performs API call for
  ///
  /// Sends a GET request to the server's '' endpoint
  /// with the provided headers and request data
  /// Returns a [GetGetCustomerLoginUrlResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.

  Future<List<GetGetCustomerLoginUrlResp>> getCustomerLoginUrl(
      String _userEmail, String _userPassword) async {
    ProgressDialogUtils.showProgressDialog();

    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Login/CustomerRegistration/$_userEmail/$_userPassword',
        options: Options(),
      );


      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response 43354${response.data}");
        return (response.data is List)
            ? (response.data as List)
                .map((e) => GetGetCustomerLoginUrlResp.fromJson(e))
                .toList()
            : (response.data is Map)
                ? [GetGetCustomerLoginUrlResp.fromJson(response.data)]
                : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
                ? (response.data as List)
                    .map((e) => GetGetCustomerLoginUrlResp.fromJson(e))
                    .toList()
                : (response.data is Map)
                    ? [GetGetCustomerLoginUrlResp.fromJson(response.data)]
                    : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Banner Api
  Future<List<MainBanner>> BannerApui() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Banner/ALL',
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
                .map((e) => MainBanner.fromJson(e))
                .toList()
            : (response.data is Map)
                ? [MainBanner.fromJson(response.data)]
                : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
                ? (response.data as List)
                    .map((e) => MainBanner.fromJson(e))
                    .toList()
                : (response.data is Map)
                    ? [MainBanner.fromJson(response.data)]
                    : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
  /// Org Commite
  Future<List<OrganizationCom>> orgComm() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/OrganisingCommittee/All',
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
            .map((e) => OrganizationCom.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [OrganizationCom.fromJson(response.data)]
            : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
            ? (response.data as List)
            .map((e) => OrganizationCom.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [OrganizationCom.fromJson(response.data)]
            : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
  /// Workshop
  Future<List<WorkshopModel>> workshop() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Workshop/All',
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
            .map((e) => WorkshopModel.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [WorkshopModel.fromJson(response.data)]
            : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
            ? (response.data as List)
            .map((e) => WorkshopModel.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [WorkshopModel.fromJson(response.data)]
            : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }


  /// message api
  Future<List<Message>> msgapi() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Message/All',
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
            .map((e) => Message.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [Message.fromJson(response.data)]
            : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
            ? (response.data as List)
            .map((e) => Message.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [Message.fromJson(response.data)]
            : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Partner Api
  Future<List<OurpartnersgridItemModel>> partnerApi() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Partner/All',
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
                .map((e) => OurpartnersgridItemModel.fromJson(e))
                .toList()
            : (response.data is Map)
                ? [OurpartnersgridItemModel.fromJson(response.data)]
                : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
                ? (response.data as List)
                    .map((e) => OurpartnersgridItemModel.fromJson(e))
                    .toList()
                : (response.data is Map)
                    ? [OurpartnersgridItemModel.fromJson(response.data)]
                    : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// events api
  Future<List<EventsModels>> eventsapi() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Event/All',
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
                .map((e) => EventsModels.fromJson(e))
                .toList()
            : (response.data is Map)
                ? [EventsModels.fromJson(response.data)]
                : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
                ? (response.data as List)
                    .map((e) => EventsModels.fromJson(e))
                    .toList()
                : (response.data is Map)
                    ? [EventsModels.fromJson(response.data)]
                    : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Setting api
  Future<void>  tokeninset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sendToken = prefs.getString('deviceToken');

    Map sendData = {
      'device': 1,
      "tokenID": 0,
      'token': sendToken.toString(),
      "statusID": 0,

    };

    var body = json.encode(sendData);
    Map<String, String> headers = {'Content-Type': 'application/json'};
    print(body);
    http.Response res = await http.post(
      Uri.parse(
          'http://akuapp-001-site1.mysitepanel.net/Login/Customertoken/insert'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    var data2 = json.decode(res.body.toString());
    print("darta ${data2.toString()}");
  }
  Future<List<SettingModel>> settingapi() async {
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Setting/All',
        options: Options(),
      );


      if (_isSuccessCall(response)) {

        return (response.data is List)
            ? (response.data as List)
                .map((e) => SettingModel.fromJson(e))
                .toList()
            : (response.data is Map)
                ? [SettingModel.fromJson(response.data)]
                : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
                ? (response.data as List)
                    .map((e) => SettingModel.fromJson(e))
                    .toList()
                : (response.data is Map)
                    ? [SettingModel.fromJson(response.data)]
                    : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }



  /// get user by id
  Future<List<GetUser>> getuser(int userid) async {
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Login/GetUser/$userid',
        options: Options(),
      );
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
            .map((e) => GetUser.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [GetUser.fromJson(response.data)]
            : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
            ? (response.data as List)
            .map((e) => GetUser.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [GetUser.fromJson(response.data)]
            : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
  /// get QR data
  Future<List<QRLogin>> getQRlogin(int userid) async {
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Login/GetDataQR/$userid',
        options: Options(),
      );
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
            .map((e) => QRLogin.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [QRLogin.fromJson(response.data)]
            : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
            ? (response.data as List)
            .map((e) => QRLogin.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [QRLogin.fromJson(response.data)]
            : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
  /// my events
  Future<List<MyEvent>> geteventsbyid(int userid) async {
    try {
      print("user id is this $userid");
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Event/AllEventsByUserID/$userid',
        options: Options(),
      );
      print("Full response data: ${response.data}");

      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
            .map((e) => MyEvent.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [MyEvent.fromJson(response.data)]
            : throw 'Invalid response type: ${response.data}';
      } else {
        throw response.data != null
            ? (response.data is List)
            ? (response.data as List)
            .map((e) => MyEvent.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [MyEvent.fromJson(response.data)]
            : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Speakers Api
  Future<List<SpeakersListModel>> SpeakerApi() async {
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Speaker/All',
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
                .map((e) => SpeakersListModel.fromJson(e))
                .toList()
            : (response.data is Map)
                ? [SpeakersListModel.fromJson(response.data)]
                : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
                ? (response.data as List)
                    .map((e) => SpeakersListModel.fromJson(e))
                    .toList()
                : (response.data is Map)
                    ? [SpeakersListModel.fromJson(response.data)]
                    : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// speaker API FOR HOME
  Future<List<SpeakersListModel>> SpeakerApiH() async {
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Speaker/All',
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
                .map((e) => SpeakersListModel.fromJson(e))
                .toList()
            : (response.data is Map)
                ? [SpeakersListModel.fromJson(response.data)]
                : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
                ? (response.data as List)
                    .map((e) => SpeakersListModel.fromJson(e))
                    .toList()
                : (response.data is Map)
                    ? [SpeakersListModel.fromJson(response.data)]
                    : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// ----->  perform Registration api to add the customer / user
  /// Post api
  /// headers and request data
  Future<PostPostCustomerSignupResp> postCustomerSignup({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/Login/user/register',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return PostPostCustomerSignupResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostPostCustomerSignupResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

   /// edit profile api
  Future<User> posteditcustomer({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/Login/Customer/edit',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return User.fromJson(response.data);
      } else {
        throw response.data != null
            ? User.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }


  /// forget
  Future<List<forgetModel>> forgetecustomer(String email) async {
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Login/user/$email/forget',
        options: Options(),
      );

      if (_isSuccessCall(response)) {

        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
            .map((e) => forgetModel.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [forgetModel.fromJson(response.data)]
            : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
            ? (response.data as List)
            .map((e) => forgetModel.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [forgetModel.fromJson(response.data)]
            : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {

      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }


  /// post registration api
  Future<RegistarModel> postregistarevent({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/Event/Register',
        data: requestData,
        options: Options(headers: headers),
      );

      print("----->>> ${response.data}");
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return RegistarModel.fromJson(response.data);
      } else {
        throw response.data != null
            ? RegistarModel.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<List<GetGetCustomerLoginUrlResp>> getgoogleSing(
      String _userEmail) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Login/CustomerLogin/$_userEmail/null/sm/null',
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
                .map((e) => GetGetCustomerLoginUrlResp.fromJson(e))
                .toList()
            : (response.data is Map)
                ? [GetGetCustomerLoginUrlResp.fromJson(response.data)]
                : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
                ? (response.data as List)
                    .map((e) => GetGetCustomerLoginUrlResp.fromJson(e))
                    .toList()
                : (response.data is Map)
                    ? [GetGetCustomerLoginUrlResp.fromJson(response.data)]
                    : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }


  Future<List<GetGetCustomerLoginUrlResp>> getapple(
      String _userEmail) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/Login/CustomerLogin/$_userEmail/null/sm/null',
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print("response ${response.data}");
        return (response.data is List)
            ? (response.data as List)
            .map((e) => GetGetCustomerLoginUrlResp.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [GetGetCustomerLoginUrlResp.fromJson(response.data)]
            : throw 'Invalid response type: ${response.data}';
      } else {
        // Handle error response
        throw response.data != null
            ? (response.data is List)
            ? (response.data as List)
            .map((e) => GetGetCustomerLoginUrlResp.fromJson(e))
            .toList()
            : (response.data is Map)
            ? [GetGetCustomerLoginUrlResp.fromJson(response.data)]
            : 'Invalid response type: ${response.data}'
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
