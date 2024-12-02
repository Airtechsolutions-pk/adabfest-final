import 'package:fluttertoast/fluttertoast.dart';

import 'models/onboarding_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'provider/onboarding_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  OnboardingScreenState createState() => OnboardingScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => OnboardingProvider(), child: OnboardingScreen());
  }
}

// ignore_for_file: must_be_immutable
class OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.bottomCenter, children: [
          SizedBox(
              child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          CustomImageView(
                              imagePath:
                                  ImageConstant.imgConferencePana,
                              height: 282.adaptSize,
                              width: 282.adaptSize,
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(top: 170.v)),
                          CustomImageView(
                              imagePath:
                              ImageConstant.foruth,
                              width: 120.adaptSize,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 220.v)),
                          Positioned(
                            top: 240.v,
                            left: 87.v, // Adjust the right position as needed
                            child: Padding(
                              padding: EdgeInsets.only(top: 4.v),
                              child: Transform.rotate(
                                angle: -1.5708, // This is the angle in radians for a 90-degree rotation
                                child: Text(
                                  "lbl_onwards".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: appTheme.black900.withOpacity(0.03),
                                    fontSize: 90.fSize,
                                    fontFamily: 'Bodoni Moda',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                 width: double.infinity,
                                  height: 200.h,
                                  decoration: AppDecoration
                                      .fillPrimary
                                      .copyWith(
                                      borderRadius:
                                      BorderRadiusStyle
                                          .customBorderTL48),
                                  child: Column(
                                      mainAxisSize:
                                      MainAxisSize.min,

                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 28.h,
                                                top: 30.v,
                                                right: 29.h),
                                            child: Text(
                                                "msg_welcome_to_aku_conference"
                                                    .tr,

                                                textAlign: TextAlign
                                                    .center,
                                                style: TextStyle(
                                                    color: theme
                                                        .colorScheme
                                                        .onErrorContainer
                                                        .withOpacity(
                                                        1),
                                                    fontSize:
                                                    23.fSize,
                                                    fontFamily:
                                                    'Inter',
                                                    fontWeight:
                                                    FontWeight
                                                        .w500))),
                                        // Container(
                                        //     margin: EdgeInsets.only(
                                        //         left: 44.h,
                                        //         top: 13.v,
                                        //         right: 43.h),
                                        //     child: Text(
                                        //         "msg_norem_ipsum_dolor"
                                        //             .tr,
                                        //
                                        //         textAlign: TextAlign
                                        //             .center,
                                        //         style: TextStyle(
                                        //             color: theme
                                        //                 .colorScheme
                                        //                 .onErrorContainer
                                        //                 .withOpacity(
                                        //                 1),
                                        //             fontSize:
                                        //             16.fSize,
                                        //             fontFamily:
                                        //             'Inter',
                                        //             fontWeight:
                                        //             FontWeight
                                        //                 .w400)))
                                      ]))),


                        ]),
                    Stack(
                        alignment: Alignment.topCenter,
                        children: [

                          CustomImageView(
                              imagePath:
                              ImageConstant.imgConferencePana1,
                              height: 282.adaptSize,
                              width: 282.adaptSize,
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(top: 170.v)),
                          CustomImageView(
                              imagePath:
                              ImageConstant.foruth,
                              width: 120.adaptSize,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 220.v)),
                          Positioned(
                            top: 240.v,
                            left: 87.v, // Adjust the right position as needed
                            child: Padding(
                              padding: EdgeInsets.only(top: 4.v),
                              child: Transform.rotate(
                                angle: -1.5708, // This is the angle in radians for a 90-degree rotation
                                child: Text(
                                  "lbl_onwards".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: appTheme.black900.withOpacity(0.03),
                                    fontSize: 90.fSize,
                                    fontFamily: 'Bodoni Moda',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  width: double.infinity,
                                  height: 200.h,
                                  decoration: AppDecoration
                                      .fillPrimary
                                      .copyWith(
                                      borderRadius:
                                      BorderRadiusStyle
                                          .customBorderTL48),
                                  child: Column(
                                      mainAxisSize:
                                      MainAxisSize.min,

                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 28.h,
                                                top: 30.v,
                                                right: 29.h),
                                            child: Text(
                                                "Easy To Register\nView AdabFestival Events "
                                                    .tr,

                                                textAlign: TextAlign
                                                    .center,
                                                style: TextStyle(
                                                    color: theme
                                                        .colorScheme
                                                        .onErrorContainer
                                                        .withOpacity(
                                                        1),
                                                    fontSize:
                                                    23.fSize,
                                                    fontFamily:
                                                    'Inter',
                                                    fontWeight:
                                                    FontWeight
                                                        .w500))),
                                        // Container(
                                        //     margin: EdgeInsets.only(
                                        //         left: 44.h,
                                        //         top: 13.v,
                                        //         right: 43.h),
                                        //     child: Text(
                                        //         "msg_norem_ipsum_dolor"
                                        //             .tr,
                                        //
                                        //         textAlign: TextAlign
                                        //             .center,
                                        //         style: TextStyle(
                                        //             color: theme
                                        //                 .colorScheme
                                        //                 .onErrorContainer
                                        //                 .withOpacity(
                                        //                 1),
                                        //             fontSize:
                                        //             16.fSize,
                                        //             fontFamily:
                                        //             'Inter',
                                        //             fontWeight:
                                        //             FontWeight
                                        //                 .w400)))
                                      ]))),


                        ]),
                    Stack(
                        alignment: Alignment.topCenter,
                        children: [

                          CustomImageView(
                              imagePath:
                              ImageConstant.imgConferencePana2,
                              height: 282.adaptSize,
                              width: 282.adaptSize,
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(top: 170.v)),
                          CustomImageView(
                              imagePath:
                              ImageConstant.foruth,
                              width: 120.adaptSize,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 220.v)),
                          Positioned(
                            top: 240.v,
                            left: 87.v, // Adjust the right position as needed
                            child: Padding(
                              padding: EdgeInsets.only(top: 4.v),
                              child: Transform.rotate(
                                angle: -1.5708, // This is the angle in radians for a 90-degree rotation
                                child: Text(
                                  "lbl_onwards".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: appTheme.black900.withOpacity(0.03),
                                    fontSize: 90.fSize,
                                    fontFamily: 'Bodoni Moda',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  width: double.infinity,
                                  height: 200.h,
                                  decoration: AppDecoration
                                      .fillPrimary
                                      .copyWith(
                                      borderRadius:
                                      BorderRadiusStyle
                                          .customBorderTL48),
                                  child: Column(
                                      mainAxisSize:
                                      MainAxisSize.min,

                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 28.h,
                                                top: 30.v,
                                                right: 29.h),
                                            child: Text(
                                                "Explore Upcoming\Events and Programmes "
                                                    .tr,

                                                textAlign: TextAlign
                                                    .center,
                                                style: TextStyle(
                                                    color: theme
                                                        .colorScheme
                                                        .onErrorContainer
                                                        .withOpacity(
                                                        1),
                                                    fontSize:
                                                    23.fSize,
                                                    fontFamily:
                                                    'Inter',
                                                    fontWeight:
                                                    FontWeight
                                                        .w500))),
                                        // Container(
                                        //     margin: EdgeInsets.only(
                                        //         left: 44.h,
                                        //         top: 13.v,
                                        //         right: 43.h),
                                        //     child: Text(
                                        //         "msg_norem_ipsum_dolor"
                                        //             .tr,
                                        //
                                        //         textAlign: TextAlign
                                        //             .center,
                                        //         style: TextStyle(
                                        //             color: theme
                                        //                 .colorScheme
                                        //                 .onErrorContainer
                                        //                 .withOpacity(
                                        //                 1),
                                        //             fontSize:
                                        //             16.fSize,
                                        //             fontFamily:
                                        //             'Inter',
                                        //             fontWeight:
                                        //             FontWeight
                                        //                 .w400)))
                                      ]))),


                        ]),

                  ])),
          _buildOnboardingPagerSection(context),
        ]));
  }

  int pageCount = 3; // Set the total number of pages here

  /// Section Widget
  Widget _buildOnboardingPagerSection(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(bottom: 30.v,right: 5.v , left: 5.v),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        onTapTxtBuildingBetter(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 1.v,left: 20.v,bottom: 10.v),
                          child: Text("lbl_skip".tr,
                              style: TextStyle(
                                  color: theme.colorScheme.onErrorContainer,
                                  fontSize: 18.fSize,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600)))),
                  SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: ScrollingDotsEffect(
                          spacing: 8,
                          activeDotColor:
                              theme.colorScheme.onErrorContainer.withOpacity(1),
                          dotColor: theme.colorScheme.onErrorContainer
                              .withOpacity(0.22),
                          dotHeight: 8.v,
                          dotWidth: 8.h),
                      onDotClicked: (value) {
                        pageController.jumpToPage(value);
                      }),
                  GestureDetector(
                    onTap: (){
                      if (pageController.hasClients) {
                        // Check if the current page is not the last page
                        if (pageController.page != pageCount - 1) {
                          // Navigate to the next page
                          pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        } else {
                          // You have reached the last page, call onTapTxtBuildingBetter
                          onTapTxtBuildingBetter(context);
                        }
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 1.v,right: 20.v,),

                      child: Text("lbl_next".tr,
                          style: TextStyle(
                              color:
                                  theme.colorScheme.onErrorContainer.withOpacity(1),
                              fontSize: 18.fSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600)),
                    ),
                  )
                ])));
  }

  /// Common widget
  Widget _buildExploreUpcomingEventsSection(
    BuildContext context, {
    required String buildingBetter,
    required String noremIpsumDolor,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 37.h, vertical: 29.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL48),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 25.v),
              Container(
                  width: 280.h,
                  margin: EdgeInsets.only(left: 11.h, right: 10.h),
                  child: Text(buildingBetter,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color:
                              theme.colorScheme.onErrorContainer.withOpacity(1),
                          fontSize: 24.fSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500))),
              SizedBox(height: 16.v),
              Container(
                  width: 212.h,
                  margin: EdgeInsets.only(left: 44.h, right: 43.h),
                  child: Text(noremIpsumDolor,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color:
                              theme.colorScheme.onErrorContainer.withOpacity(1),
                          fontSize: 16.fSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400)))
            ]));
  }

  /// Navigates to the bannerScreen when the action is triggered.
  onTapTxtBuildingBetter(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboarding_completed', true);
    _onGetCustomerLoginUrlEventSuccess();
  }
  void _onGetCustomerLoginUrlEventSuccess(
      [BuildContext? context,]) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
    );
  }

}
