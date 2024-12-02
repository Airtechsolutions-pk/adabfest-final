import 'package:adabfest/presentation/MainScreen/main_screen.dart';
import 'package:adabfest/presentation/admin_login_one_screen/admin_login_one_screen.dart';
import 'package:adabfest/presentation/admin_login_screen/admin_login_screen.dart';
import 'package:adabfest/presentation/edit_profile_screen/edit_screen.dart';
import 'package:adabfest/presentation/forget_password_screen/forget_password.dart';
import 'package:adabfest/presentation/msg_from_chair_screen/models/msg_from_chair_model.dart';
import 'package:adabfest/presentation/msg_from_chair_screen/msg_chair_app_screen.dart';
import 'package:adabfest/presentation/msg_from_cnf_chair/models/msg_from_chair_model.dart';
import 'package:adabfest/presentation/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:adabfest/presentation/splash_screen/splash_screen.dart';
import 'package:adabfest/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:adabfest/presentation/login_screen/login_screen.dart';
import 'package:adabfest/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:adabfest/presentation/home_screen/home_screen.dart';
import 'package:adabfest/presentation/event_details_screen/event_details_screen.dart';
import 'package:adabfest/presentation/registration_screen/registration_screen.dart';
import 'package:adabfest/presentation/e_pass_downlaod_screen/e_pass_downlaod_screen.dart';
import 'package:adabfest/presentation/e_pass_downlaod_two_screen/e_pass_downlaod_two_screen.dart';
import 'package:adabfest/presentation/speaker_detail_screen/speaker_detail_screen.dart';
import 'package:adabfest/presentation/app_navigation_screen/app_navigation_screen.dart';

import '../presentation/MyTickets_Details/my_tickets_detials.dart';
import '../presentation/about_the_app_screen/about_the_app_screen.dart';
import '../presentation/bookmark_screen/bookmark_screen.dart';
import '../presentation/events_all_page/events_all_page.dart';
import '../presentation/faqs_screen/faqs_screen.dart';
import '../presentation/msg_from_cnf_chair/msg__cnfr_chair_app_screen.dart';
import '../presentation/my_tickets_screen/my_tickets_screen.dart';
import '../presentation/org_list_page/org_list_page.dart';
import '../presentation/our_partners_screen/our_partners_screen.dart';
import '../presentation/past_events_empty_page/past_events_empty_page.dart';
import '../presentation/payment_screenshot_upload_screen/payment_screenshot_upload_screen.dart';
import '../presentation/privacy_policy_screen/privacy_policy_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingScreen = '/onboarding_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String bannerScreen = '/banner_screen';

  static const String homeScreen = '/home_screen';
  static const String chairmen = '/chairmen_screen';
  static const String cnfrChairmen = '/cnfr_chair_screen';

  static const String mainPage = '/main_page';
  static const String my_events = '/my_Events';


  static const String eventsAllPage = '/events_all_page';
  static const String orgCom = '/org_page';

  static const String pastEventsPage = '/past_events_page';

  static const String pastEventsTabContaiPage = '/past_events_tab_contai_page';

  static const String pastEventsEmptyPage = '/past_events_empty_page';

  static const String eventDetailsScreen = '/event_details_screen';

  static const String registrationScreen = '/registration_screen';

  static const String epassDownlaodScreen = '/epass_downlaod_screen';

  static const String epassDownlaodtwoScreen = '/epass_downlaodtwo_screen';

  static const String speakersListPage = '/speakers_list_page';
  static const String editprofile = '/edit_profile_page';

  static const String speakerDetailOneScreen = '/speaker_detail_one_screen';

  static const String speakerDetailTwoScreen = '/speaker_detail_two_screen';

  static const String speakerDetailScreen = '/speaker_detail_screen';
  static const String searchscreen = '/search_Screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String aboutTheAppScreen = '/about_the_app_screen';

  static const String ourPartnersScreen = '/our_partners_screen';

  static const String bookmarkScreen = '/bookmark_screen';

  static const String faqsScreen = '/faqs_screen';

  static const String privacyPolicyScreen = '/privacy_policy_screen';
  static const String adminlogin = '/admin_login_screen';
  static const String adminloginscreen = '/admin_login_screen1';
  static const String eventpast = '/past_event_page';
  static const String forgetScreen = '/forget_screen';
  static const String myevent_detials = '/myevents_details';

  static const String paymentScreenshotUploadScreen =
      '/payment_screenshot_upload_screen';

  static const String fileUploaderScreen = '/file_uploader_screen';

  static const String fileUploadedScreen = '/file_uploaded_screen';
  static const String initialRoute = '/initialRoute';


  static Map<String, WidgetBuilder> get routes => {
    splashScreen: SplashScreen.builder,
    onboardingScreen: OnboardingScreen.builder,
    loginScreen: LoginScreen.builder,
    signUpScreen: SignUpScreen.builder,
    forgetScreen: forgetPassword.builder,
    myevent_detials: MyTickets_Details.builder,
    chairmen: MsgfromChair.builder,
    cnfrChairmen: MsgfromConfrChair.builder,
    orgCom: OrgListPage.builder,

    adminlogin: AdminLoginOneScreen.builder,
    adminloginscreen: AdminLoginScreen.builder,
    eventpast : PastEventsEmptyPage.builder,
    paymentScreenshotUploadScreen: PaymentScreenshotUploadScreen.builder,
    eventsAllPage : EventsAllPage.builder,
    mainPage : Main_Screen.builder,
    aboutTheAppScreen: AboutTheAppScreen.builder,
    ourPartnersScreen: OurPartnersScreen.builder,
    bookmarkScreen: BookmarkScreen.builder,
    faqsScreen: FaqsScreen.builder,
    editprofile: EditProfile.builder,
    my_events: MyTicketsScreen.builder,

    privacyPolicyScreen: PrivacyPolicyScreen.builder,
    eventDetailsScreen: EventDetailsScreen.builder,
    registrationScreen: RegistrationScreen.builder,
    epassDownlaodScreen: EPassDownlaodScreen.builder,
    epassDownlaodtwoScreen: EPassDownlaodTwoScreen.builder,
    searchscreen: SearchScreen.builder,

    speakerDetailScreen: SpeakerDetailScreen.builder,
    appNavigationScreen: AppNavigationScreen.builder,
    initialRoute: SplashScreen.builder
  };
}
