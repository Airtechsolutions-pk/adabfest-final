import 'package:adabfest/data/models/setting/settingModel.dart';
import 'package:adabfest/presentation/more_screen/provider/logoutwidget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../login_screen/provider/login_provider.dart';
import '../more_screen_dialog/more_screen_dialog.dart';
import 'models/more_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_title.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:adabfest/widgets/custom_bottom_bar.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'provider/more_provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MoreScreenState createState() => MoreScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoreProvider(),
      child: MoreScreen(),
    );
  }
}

class MoreScreenState extends State<MoreScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  bool isLoggedIn = false;

  Future<void> checkLoggedInStatus() async {
    bool loggedIn = await LoginProvider().isLoggedIn();
    setState(() {
      isLoggedIn = loggedIn;
    });
  }

  @override
  void initState() {
    super.initState();
    checkLoggedInStatus();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int? userId =
          await Provider.of<MoreProvider>(context, listen: false).getUserId();

      print("user id $userId");

      Provider.of<MoreProvider>(context, listen: false).callspeakerApi(
        onSuccess: () {},
        onError: () {},
      );

      Provider.of<MoreProvider>(context, listen: false).calluserapi(
        onSuccess: () {},
        uid: userId, // here is want to bind userid,
        onError: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: appTheme.gray50,
      body: Consumer<MoreProvider>(builder: (context, moreProvider, _) {
        return SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 21.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // moreProvider.getuser.isNotEmpty && isLoggedIn
                        //     ? Text(
                        //         "Hi ${moreProvider.getuser[0].user?.userName ?? "User"}",
                        //         style: CustomTextStyles
                        //             .headlineSmallInterOnPrimary,
                        //       )
                        //     : SizedBox(),
                        // moreProvider.getuser.isNotEmpty && isLoggedIn ?    Text(
                        //   "Hi ${moreProvider.getuser[0].user?.userName ?? "User"}".tr,
                        //   style: CustomTextStyles.headlineSmallInterOnPrimary,
                        // ) : CircularProgressIndicator(color: Colors.red,),
                        // SizedBox(height: 7.v),
                        // isLoggedIn
                        //     ? CustomElevatedButton(
                        //         height: 27.v,
                        //         width: 115.h,
                        //         onPressed: () {
                        //           NavigatorService.pushNamed(
                        //             AppRoutes.editprofile,
                        //             arguments: moreProvider.getuser[0].user,
                        //           );
                        //         },
                        //         text: "lbl_edit_profile".tr,
                        //         leftIcon: Container(
                        //           margin: EdgeInsets.only(left: 7.h),
                        //           child: CustomImageView(
                        //             imagePath:
                        //                 ImageConstant.imgClarityeditsolid,
                        //             height: 16.adaptSize,
                        //             width: 16.adaptSize,
                        //           ),
                        //         ),
                        //         buttonStyle: ButtonStyle(
                        //           backgroundColor:
                        //               MaterialStateProperty.all<Color?>(
                        //                   Colors.grey.shade200),
                        //         ),
                        //         buttonTextStyle:
                        //             CustomTextStyles.titleSmallPrimary,
                        //       )
                        //     : SizedBox(),
                        SizedBox(height: 2.v),
                        _buildAppSettings(context, moreProvider),
                        SizedBox(height: 17.v),
                        _buildPopular(context),

                        SizedBox(height: 5.v),

                        //   _buildAdminLogin(context),
                        SizedBox(height: 9.v),
                        Text(
                          "lbl_social_links".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        SizedBox(height: 9.v),

                        _buildSocial(context, moreProvider),
                        SizedBox(height: 10.v),

                        isLoggedIn
                            ? CustomElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            content: LogoutPop(),
                                            backgroundColor: Colors.transparent,
                                            contentPadding: EdgeInsets.zero,
                                            insetPadding:
                                                const EdgeInsets.only(left: 0),
                                          ));
                                },
                                height: 44.v,
                                alignment: Alignment.center,

                                text: "lbl_logout".tr.toUpperCase(),
                                // leftIcon: Container(
                                //   alignment: Alignment.center,
                                //   margin: EdgeInsets.only(right: 8.h),
                                //   child: CustomImageView(
                                //     alignment: Alignment.center,
                                //     imagePath: ImageConstant.imgUserOnerrorcontainer,
                                //
                                //     height: 24.adaptSize,
                                //     width: 24.adaptSize,
                                //   ),
                                // ),
                                buttonStyle: CustomButtonStyles.fillRed,
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumWhiteA700_1,
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    ));
  }

  Widget _buildAdminLogin(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.h,
            ),
            child: Text(
              "lbl_admin_login".tr,
              style: theme.textTheme.titleLarge,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 2.h,
              vertical: 13.v,
            ),
            child: Card(
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.h,
                        bottom: 1.v,
                      ),
                      child: Text(
                        "lbl_admin".tr,
                        style: CustomTextStyles.titleSmallBlack900Medium,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowRight,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// build social links
  Widget _buildSocial(BuildContext context, MoreProvider moreProvider) {
    List<SettingModel> settingsList = moreProvider.getsetting;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.h,
        vertical: 1.v,
      ),
      child: Card(
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                onTap: () async {
                  String facebookUrl =
                      settingsList[0].setting?.facebookUrl ?? '';
                  Uri uri = Uri.parse(facebookUrl);

                  if (await canLaunchUrl(uri)) {
                    await launchUrl(
                      uri,
                      mode: LaunchMode
                          .externalApplication, // This will use external browser or app
                    );
                  } else {
                    // Handle error, e.g., show an error message
                    print('Could not launch $facebookUrl');
                  }
                },
                imagePath: ImageConstant.facebook,
                height: 30.adaptSize,
                width: 30.adaptSize,
              ),
              SizedBox(width: 5),
              CustomImageView(
                onTap: () async {
                  String instagramUrl =
                      settingsList[0].setting?.instagramUrl ?? '';
                  Uri uri = Uri.parse(instagramUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    print('Could not launch $instagramUrl');
                  }
                },
                imagePath: ImageConstant.insta,
                height: 35.adaptSize,
                width: 35.adaptSize,
              ),
              SizedBox(width: 5),
              CustomImageView(
                onTap: () async {
                  String twitterUrl = settingsList[0].setting?.twitterUrl ?? '';
                  Uri uri = Uri.parse(twitterUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    print('Could not launch $twitterUrl');
                  }
                },
                imagePath: ImageConstant.x,
                height: 33.adaptSize,
                width: 30.adaptSize,
              ),
              SizedBox(width: 5),
              CustomImageView(
                onTap: () async {
                  String youtubeUrl =
                      settingsList[0]?.setting?.youtubeUrl ?? '';
                  Uri uri = Uri.parse(youtubeUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    print('Could not launch $youtubeUrl');
                  }
                },
                imagePath: ImageConstant.yt,
                height: 30.adaptSize,
                width: 30.adaptSize,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppSettings(BuildContext context, MoreProvider moreProvider) {
    List<SettingModel> settingsList = moreProvider.getsetting;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            "lbl_general".tr,
            style: theme.textTheme.titleLarge,
          ),
        ),
        SizedBox(height: 3.v),
        Container(
          child: Card(
            elevation: 0.9,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: _buildOurPartners(
                      context,
                      onTap: () {
                        NavigatorService.pushNamed(AppRoutes.aboutTheAppScreen,
                            arguments: settingsList[0].setting ?? 'Not Coming');
                      },
                      title: "lbl_about_the_app".tr,
                    ),
                  ),
                  SizedBox(height: 6.v),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(height: 9.v),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: _buildOurPartners(
                      context,
                      onTap: () {
                        NavigatorService.pushNamed(
                          AppRoutes.ourPartnersScreen,
                        );
                      },
                      title: "lbl_our_partners".tr,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(height: 9.v),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: _buildOurPartners(
                      context,
                      onTap: () {
                        NavigatorService.pushNamed(
                          AppRoutes.orgCom,
                        );
                      },
                      title: "Organising Committee".tr,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  // Divider(
                  //   color: Colors.grey.shade300,
                  // ),
                  // SizedBox(height: 9.v),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 10.h),
                  //   child: _buildOurPartners(
                  //     context,
                  //     onTap: () async {
                  //     //  https://www.aku.edu/events/aasc/Documents/Hackbook%202024.pdf
                  //       String googleMapsUrl = 'https://www.aku.edu/events/aasc/Documents/Hackbook%202024.pdf';
                  //       if (await canLaunch(googleMapsUrl)) {
                  //       await launch(googleMapsUrl);
                  //       } else {
                  //       throw 'Could not launch $googleMapsUrl';
                  //       }
                  //
                  //     },
                  //     title: "Hackathon".tr,
                  //   ),
                  // ),
                  SizedBox(height: 9.v),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  // SizedBox(height: 9.v),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 10.h),
                  //   child: _buildOurPartners(
                  //     context,
                  //     onTap: () {
                  //       NavigatorService.pushNamed(
                  //         AppRoutes.bookmarkScreen,
                  //       );
                  //     },
                  //     title: "lbl_bookmark_events".tr,
                  //   ),
                  // ),
                  // SizedBox(height: 9.v),
                  // Divider(
                  //   color: Colors.grey.shade300,
                  // ),
                  SizedBox(height: 9.v),
                  isLoggedIn
                      ? Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: _buildOurPartners(
                            context,
                            onTap: () {
                              NavigatorService.pushNamed(
                                AppRoutes.my_events,
                              );
                            },
                            title: "My QR".tr,
                          ),
                        )
                      : Container(),
                  SizedBox(height: 9.v),
                  // Divider(
                  //   color: Colors.grey.shade300,
                  // ),
                  // SizedBox(height: 9.v),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 10.h),
                  //   child: _buildOurPartners(
                  //     context,
                  //     onTap: () {
                  //       NavigatorService.pushNamed(
                  //         AppRoutes.faqsScreen,
                  //       );
                  //     },
                  //     title: "lbl_faqs".tr,
                  //   ),
                  // ),
                  // SizedBox(height: 9.v),
                  // Divider(
                  //   color: Colors.grey.shade300,
                  // ),
                  // SizedBox(height: 9.v),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 10.h),
                  //   child: _buildOurPartners(
                  //     context,
                  //     onTap: () {},
                  //     title: "lbl_rate_the_app".tr,
                  //   ),
                  // ),
                  // SizedBox(height: 8.v),
                  // Divider(
                  //   color: Colors.grey.shade300,
                  // ),
                  // SizedBox(height: 9.v),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 10.h),
                  //   child: _buildOurPartners(
                  //     context,
                  //     onTap: () {
                  //       NavigatorService.pushNamed(
                  //           AppRoutes.privacyPolicyScreen,
                  //           arguments: settingsList[0].setting);
                  //     },
                  //     title: "lbl_privacy_policy".tr,
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildPopular(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.v),
        Container(
          child: Card(
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.h,
                      right: 5.h,
                    ),
                    child: _buildDeleteAccount(
                      context,
                      text1: "lbl_language".tr,
                      text2: "lbl_english".tr,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Divider(color: Colors.grey.shade300,),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(left: 8.h, right: 5.h, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        isLoggedIn
                            ? showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      content:
                                          MoreScreenDialog.builder(context),
                                      backgroundColor: Colors.transparent,
                                      contentPadding: EdgeInsets.zero,
                                      insetPadding:
                                          const EdgeInsets.only(left: 0),
                                    ))
                            : Fluttertoast.showToast(
                                msg: "First Login then you can delete account",
                                textColor: Colors.white,
                                fontSize: 16.fSize,
                                backgroundColor: Colors.red.shade600);
                      },
                      child: _buildDeleteAccount(
                        context,
                        text1: "lbl_delete_account".tr,
                        text2: "lbl_delete".tr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildOurPartners(
    BuildContext context, {
    required String title,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Text(
              title,
              style: CustomTextStyles.titleSmallBlack900Medium.copyWith(
                color: appTheme.black900.withOpacity(0.99),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildDeleteAccount(
    BuildContext context, {
    required String text1,
    required String text2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: CustomTextStyles.titleSmallBlack900Medium.copyWith(
            color: appTheme.black900.withOpacity(0.99),
          ),
        ),
        Text(
          text2,
          style: CustomTextStyles.titleSmallRed500a6.copyWith(
            color: appTheme.red500A6,
          ),
        ),
      ],
    );
  }
}
