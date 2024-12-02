import 'package:flutter_html/flutter_html.dart';

import '../../data/models/setting/settingModel.dart';
import 'models/privacy_policy_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'provider/privacy_policy_provider.dart';
import 'package:flutter_html/src/style.dart' as styleshtml;

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  PrivacyPolicyScreenState createState() => PrivacyPolicyScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PrivacyPolicyProvider(),
        child: PrivacyPolicyScreen());
  }
}

class PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Setting;

    return Scaffold(
        backgroundColor: appTheme.gray100,
        appBar: _buildAppBar(context),
        body: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.h, vertical: 19.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                            opacity: 0.99,
                            child: Text("lbl_privacy_policy".tr,
                                style: theme.textTheme.titleLarge)),
                        SizedBox(height: 18.v),
                        // Container(
                        //     width: 334.h,
                        //     decoration: BoxDecoration(
                        //         color: appTheme.whiteA700,
                        //         borderRadius: BorderRadius.circular(3.h),
                        //         boxShadow: [
                        //           BoxShadow(
                        //               color: appTheme.black900
                        //                   .withOpacity(0.11),
                        //               spreadRadius: 2.h,
                        //               blurRadius: 2.h,
                        //               offset: Offset(0, 3))
                        //         ]),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(8.0),
                        //       child:  Html(
                        //         data: args.privacyPolicy.toString() != ''
                        //             ? '${args.privacyPolicy.toString()}'
                        //             : 'Not Available',
                        //         style: {
                        //           "div": styleshtml.Style(
                        //             fontFamily: 'Proxima Nova',
                        //             fontWeight: FontWeight.w600,
                        //             fontSize: FontSize(14),
                        //           ),
                        //           "a": styleshtml.Style(textDecoration: TextDecoration.none),
                        //         },
                        //       ),
                        //     )),
                        SizedBox(height: 5.v)
                      ]))
            ])));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 58.h,
      backgroundColor: Color(0xffE30512),
      leading: AppbarLeadingImage(
        onTap: (){
          NavigatorService.goBack();
        },
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
            top: 2.v,
            right: 19.h,
            left: 12
        ),
      ),
      title: Text(
        "Privacy & Policy",
        style: TextStyle(
            color: Colors.white,
            fontSize: 20.fSize,
            fontWeight: FontWeight.w500
        ),
      ),
      centerTitle: true,
    );
  }

  /// Navigates to the homeScreenContainerScreen when the action is triggered.
  onTapImgHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }
}
