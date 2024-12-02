import 'package:adabfest/data/models/GetUserModel/getuser_model.dart';
import 'package:adabfest/data/models/GlobalEvents/EventsModals.dart';
import 'package:adabfest/data/models/getCustomerLoginUrl/get_get_customer_login_url_resp.dart';
import 'package:adabfest/data/models/messagemodel/MessageModel.dart';
import 'package:adabfest/data/models/myevents/myevents.dart';
import 'package:adabfest/data/models/orgCommte/organizatiomModel.dart';
import 'package:adabfest/data/models/registarModel/registar_model.dart';
import 'package:adabfest/data/models/setting/settingModel.dart';
import 'package:adabfest/data/models/speakermodel/speaker_model.dart';
import 'package:adabfest/data/models/workshopModel/workShopmodel.dart';
import 'package:adabfest/presentation/home_screen/models/Banner.dart';

import '../../presentation/login_screen/models/login_model.dart';
import '../../presentation/our_partners_screen/models/ourpartnersgrid_item_model.dart';
import '../../presentation/sign_up_screen/models/sign_up_model.dart';
import '../apiClient/api_client.dart';
import '../models/QRLogin/Qr_login.dart';
import '../models/forgetresponsemodel.dart';

/// Repository class for managing API requests.
///
/// This class provides a simplified interface for making the
/// API request using the [ApiClient] instance
class Repository {
  final _apiClient = ApiClient();

  Future<List<GetGetCustomerLoginUrlResp>> getCustomerLoginUrl(String email, String password) async {
    return await _apiClient.getCustomerLoginUrl(email,password);
  }


  Future<List<GetGetCustomerLoginUrlResp>> getgoogleSing(String email) async {
    return await _apiClient.getgoogleSing(email);
  }

  Future<List<GetGetCustomerLoginUrlResp>> getapple(String email) async {
    return await _apiClient.getapple(email);
  }

  Future<List<GetUser>> getuserbyid(int uid) async {
    return await _apiClient.getuser(uid);
  }

  Future<List<QRLogin>> getqrbyid(int uid) async {
    return await _apiClient.getQRlogin(uid);
  }

  Future<List<MyEvent>> getbyeventid(int uid) async {
    return await _apiClient.geteventsbyid(uid);
  }


  Future<List<MainBanner>> bannerApi() async {
    return await _apiClient.BannerApui();
  }

  Future<List<Message>> msgApi() async {
    return await _apiClient.msgapi();
  }

  Future<List<OrganizationCom>> orgCom() async {
    return await _apiClient.orgComm();
  }
  Future<List<WorkshopModel>> workshopApi() async {
    return await _apiClient.workshop();
  }
  Future<void> token() async {
    return await _apiClient.tokeninset();
  }

  Future<List<SpeakersListModel>> SpeakersApi() async {
    return await _apiClient.SpeakerApi();
  }

  Future<List<SpeakersListModel>> SpeakersApiHome() async {
    return await _apiClient.SpeakerApiH();
  }
  Future<List<OurpartnersgridItemModel>> partnerApi() async {
    return await _apiClient.partnerApi();
  }
  Future<List<EventsModels>> events() async {
    return await _apiClient.eventsapi();
  }
  Future<List<SettingModel>> setting() async {
    return await _apiClient.settingapi();
  }
  Future<PostPostCustomerSignupResp> postCustomerSignup({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.postCustomerSignup(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<User> posteditcustomer({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.posteditcustomer(
      headers: headers,
      requestData: requestData,
    );
  }


  Future<List<forgetModel>> forgettcustomer(String email) async {
    return await _apiClient.forgetecustomer(email);
  }


  Future<RegistarModel> postRegistration({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.postregistarevent(
      headers: headers,
      requestData: requestData,
    );
  }
}

