import 'package:adabfest/data/models/speakermodel/speaker_model.dart';
import 'package:flutter_html/flutter_html.dart';

import '../speaker_detail_screen/widgets/eventdetails_item_widget.dart';
import 'models/eventdetails_item_model.dart';
import 'models/speaker_detail_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'provider/speaker_detail_provider.dart';
import 'package:flutter_html/src/style.dart' as styleshtml;

class SpeakerDetailScreen extends StatefulWidget {
  const SpeakerDetailScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SpeakerDetailScreenState createState() => SpeakerDetailScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpeakerDetailProvider(),
      child: SpeakerDetailScreen(),
    );
  }
}

class SpeakerDetailScreenState extends State<SpeakerDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Speaker;

    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor:Colors.grey.shade100,
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 24.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildUserProfile(context,args),
              // _buildRegisterButton(context),
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
      centerTitle: true,
      title: Text(
        'Speaker Details',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.fSize,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context,Speaker args) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(

        margin: EdgeInsets.only(right: 2.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:  BorderRadius.circular(
        65.adaptSize,
        ),

              child: CustomImageView(
                imagePath: args.image,
                height: 120.adaptSize,
                width: 120.adaptSize,
                radius: BorderRadius.circular(
                  10.h,
                ),
              ),
            ),
            SizedBox(height: 9.v),
            Text(
              "${args.name}".tr,
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 24.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 2.v),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 55.0,right: 15.0),
                child: Text(
                  "${args.designation}".tr,
                  style: TextStyle(
                    color: appTheme.gray700,
                    fontSize: 14.fSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height:5.v),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 10.v,
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Speaker".tr,
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Container(
                    width: double.infinity,
                    child: Card(
                     surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 3,top: 3),
                        child: Html(
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRegisterButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: 0.84,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "lbl_recent_events".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 20.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 6.v),
          Container(

            child: SizedBox(
              height: 276.v,
              child: Consumer<SpeakerDetailProvider>(
                builder: (context, provider, child) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return SizedBox(
                        width: 10.0.h,

                      );
                    },
                    itemCount: provider
                        .speakerDetailModelObj.eventdetailsItemList.length,
                    itemBuilder: (context, index) {
                      EventdetailsItemModel model = provider
                          .speakerDetailModelObj.eventdetailsItemList[index];
                      return EventdetailsItemWidget(
                        model,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
