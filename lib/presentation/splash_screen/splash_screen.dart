import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../login_screen/provider/login_provider.dart';
import 'models/splash_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/splash_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SplashProvider(), child: SplashScreen());
  }
}

class SplashScreenState extends State<SplashScreen> {
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    checkLoggedInStatus();
  //  firebaseCloudMessagingListeners();
    checkOnboardingStatus();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashProvider>(context, listen: false).callspeakerApi(
        onSuccess: () {

        },
        onError: () {},
      );
    });


  }
  bool isLoggedIn = false;

  Future<void> checkLoggedInStatus() async {
    bool loggedIn = await LoginProvider().isLoggedIn();
    setState(() {
      isLoggedIn = loggedIn;
    });
  }
  Future<void> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;

    Future.delayed(const Duration(milliseconds: 4000), () {
      if (onboardingCompleted  ) {
        // User has completed onboarding, navigate to another screen (e.g., HomeScreen)
        isLoggedIn ?  NavigatorService.popAndPushNamed(
          AppRoutes.mainPage,
        ) : NavigatorService.pushNamed(
          AppRoutes.loginScreen,
        );
      } else {
        // User hasn't completed onboarding, navigate to OnboardingScreen
        NavigatorService.popAndPushNamed(
          AppRoutes.onboardingScreen,
        );
      }
    });
  }

  // void firebaseCloudMessagingListeners() {
  //   _firebaseMessaging.getToken().then((deviceToken) async {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setString('deviceToken', deviceToken!);
  //     print("de $deviceToken");
  //     FirebaseMessaging.onMessageOpenedApp.listen((message) {
  //     });
  //     _firebaseMessaging.setAutoInitEnabled(true);
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       RemoteNotification? notification = message.notification;
  //       AndroidNotification? android = message.notification?.android;
  //     });
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SplashProvider>(
        builder: (context, splashProvider, _) {
          imageUrl = splashProvider.imageUrl ?? '';

          return Center(
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              fit: BoxFit.fill,
              width: double.infinity,


              placeholder: (context, url) => Image.asset(
                ImageConstant.imgAgaKhanUniversityLogo99x99,
                fit: BoxFit.contain,
                height: 115.adaptSize,
                width: 115.adaptSize,
              ),
              errorWidget: (context, url, error) =>  Image.asset(
                ImageConstant.imgAgaKhanUniversityLogo99x99,
                fit: BoxFit.contain,
                height: 115.adaptSize,
                width: 115.adaptSize,
              ),
            ),
          );
        },
      ),
    );
  }
}
