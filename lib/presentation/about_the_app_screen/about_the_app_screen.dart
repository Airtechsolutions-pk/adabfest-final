import 'package:adabfest/data/models/setting/settingModel.dart';
import 'package:flutter_html/flutter_html.dart';

import 'models/about_the_app_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'provider/about_the_app_provider.dart';
import 'package:flutter_html/src/style.dart' as styleshtml;

class AboutTheAppScreen extends StatefulWidget {
  const AboutTheAppScreen({Key? key}) : super(key: key);

  @override
  AboutTheAppScreenState createState() => AboutTheAppScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AboutTheAppProvider(), child: AboutTheAppScreen());
  }
}

class AboutTheAppScreenState extends State<AboutTheAppScreen> {
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 17.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: 0.84,
                      child: Text("lbl_about_the_app".tr, style: theme.textTheme.titleLarge),
                    ),
                    SizedBox(height: 8.v),
                    Container(
                      child: Card(
                        surfaceTintColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.v),
                              Container(
                                width: 290.h,
                                margin: EdgeInsets.only(right: 11.h),
                                child:  Html(
                                  data: args.about != ''
                                      ? '${args.about}'
                                      : 'Not Available',
                                  style: {
                                    "div": styleshtml.Style(
                                      fontFamily: 'Proxima Nova',
                                      fontWeight: FontWeight.w600,
                                      fontSize: FontSize(14),
                                    ),
                                    "a": styleshtml.Style(textDecoration: TextDecoration.none),
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 58.h,
      backgroundColor: Color(0xffE30512),
      centerTitle: true,
      title: Text("About",style: TextStyle(
        color: Colors.white,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w500
      ),),
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
    );
  }

  /// Navigates to the homeScreenContainerScreen when the action is triggered.
  onTapImgHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }
}
