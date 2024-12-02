import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/MainScreen/provider/provider.dart';
import 'package:adabfest/presentation/events_all_page/events_all_page.dart';
import 'package:adabfest/presentation/events_all_page/provider/events_all_provider.dart';
import 'package:adabfest/presentation/home_screen/home_screen.dart';
import 'package:adabfest/presentation/home_screen/provider/home_provider.dart';
import 'package:adabfest/presentation/more_screen/more_screen.dart';
import 'package:adabfest/presentation/more_screen/provider/more_provider.dart';
import 'package:adabfest/presentation/search_screen/provider/search_provder.dart';
import 'package:adabfest/presentation/speakers_list_page/provider/speakers_list_provider.dart';
import 'package:adabfest/presentation/speakers_list_page/speakers_list_page.dart';
import 'package:adabfest/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../past_events_tab_container_page/past_events_tab_container_page.dart';
import '../past_events_tab_container_page/provider/past_events_tab_container_provider.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({Key? key}) : super(key: key);

  @override
  State<Main_Screen> createState() => Main_ScreenState();

  static Widget builder(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Main_ScreenNotifier()),
        ChangeNotifierProvider(create: (context) => HomeProvider()), // Add this line
        ChangeNotifierProvider(create: (context) => PastEventsTabContainerProvider()), // Add this line
        ChangeNotifierProvider(create: (context) => EventsAllProvider()), // Add this line
        ChangeNotifierProvider(create: (context) => SpeakersListProvider()), // Add this line
        ChangeNotifierProvider(create: (context) => MoreProvider()), // Add this line
        ChangeNotifierProvider(create: (context) => SearchProvider()), // Add this line


      ],
      child: Main_Screen(),
    );
  }
}

class Main_ScreenState extends State<Main_Screen> with SingleTickerProviderStateMixin {
  late Timer _popupTimer;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Main_ScreenNotifier>(context, listen: false).callspeakerApi(
        onSuccess: () {
          _initializeAnimation();
          _setupPopupTimer();

        },
        onError: () {},
      );
    });

  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Adjust the duration as needed
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
  }

  void _setupPopupTimer() {
    const delayInSeconds = 4;
    _popupTimer = Timer(Duration(seconds: delayInSeconds), () {
      // Start the animation when the timer triggers
      _animationController.forward();
      // Show the dialog after starting the animation
     _showAppUpdateDialog();
    });
  }

  
  @override
  void dispose() {
    _popupTimer.cancel();
    _animationController.dispose();
    super.dispose();
  }


  final widgetOptions = [
    HomeScreen(),
    PastEventsTabContainerPage(),
    SpeakersListPage(),
    MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final appcastURLiOS =
        'https://github.com/Airtechsolutions-pk/akueventios/blob/main/akuios.xml';
    final cfgAndroid = AppcastConfiguration(url: appcastURLiOS, supportedOS: ['ios']);
    final appcastURLAndroid =
        'https://github.com/Airtechsolutions-pk/akuevent/blob/main/akuevent.xml';
    final cfgiOS = AppcastConfiguration(url: appcastURLAndroid, supportedOS: ['android']);
    final appcastConfig = Platform.isIOS ? cfgiOS : cfgAndroid;
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Color(0xffFAFAFA),

      body: UpgradeAlert(
          upgrader: Upgrader(
            appcastConfig: appcastConfig,
            debugLogging: true,
            dialogStyle: Platform.isIOS
                ? UpgradeDialogStyle.cupertino
                : UpgradeDialogStyle.material,
          ),
          child: widgetOptions[selectedIndex]),
      bottomNavigationBar: Container(
        height: 88.v,
        decoration: BoxDecoration(
          color: theme.colorScheme.onErrorContainer.withOpacity(1),
          boxShadow: [
            BoxShadow(
              color: appTheme.indigo20021,
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(
                0,
                -3,
              ),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].icon ?? "",
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    color: appTheme.gray600,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: TextStyle(
                        color: appTheme.gray600,
                        fontSize: 12.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon ?? '',
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    color: theme.colorScheme.primary,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 12.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex = index;


            setState(() {});
          },
        ),
      ),
    );
  }
  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 10),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/appbarimg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.15, // Responsive height
                width: MediaQuery.of(context).size.width * 0.4,    // Responsive width
                child: Image.asset(
                  ImageConstant.appbar,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int selectedIndex = 0;
  Future<void> _showAppUpdateDialog() async {
   String? img = Provider.of<Main_ScreenNotifier>(context, listen: false).imageUrl;
    showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child:FadeTransition(
            opacity: _opacityAnimation,
            child: Dialog(
            
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent,
            
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        child: CustomImageView(
                          imagePath: img.toString(),
                          height: 350.v,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: CustomImageView(
                          imagePath: ImageConstant.imgPlusCircle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

      },
    );
  }

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavExploreinactive,
      activeIcon: ImageConstant.imgNavExplore,
      title: "lbl_explore".tr,
      type: BottomBarEnum.Explore,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavEvents,
      activeIcon: ImageConstant.imgNavEventsactive,
      title: "lbl_events".tr,
      type: BottomBarEnum.Events,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavSpeakers,
      activeIcon: ImageConstant.imgNavSpeakersactive,
      title: "lbl_speakers".tr,
      type: BottomBarEnum.Speakers,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMore,
      activeIcon: ImageConstant.imgNavMore,
      title: "Related Info".tr,
      type: BottomBarEnum.More,
    )
  ];
}
