import 'models/e_pass_downlaod_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_title.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'provider/e_pass_downlaod_provider.dart';

class EPassDownlaodScreen extends StatefulWidget {
  const EPassDownlaodScreen({Key? key})
      : super(
          key: key,
        );

  @override
  EPassDownlaodScreenState createState() => EPassDownlaodScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EPassDownlaodProvider(),
      child: EPassDownlaodScreen(),
    );
  }
}

class EPassDownlaodScreenState extends State<EPassDownlaodScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 1.v,
        ),
        child: Column(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgQr,
              height: 220.adaptSize,
              width: 220.adaptSize,
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: _buildUserProfile(
                context,
                fullName: "lbl_event".tr,
                value: "msg_surgery_in_the_digital".tr,
                value1: "lbl_date_time".tr,
                email: "lbl_march_1_3_2024".tr,
                value2: "lbl_organized_by".tr,
                phoneNo: "msg_department_of_surgery".tr,
              ),
            ),
            SizedBox(height: 15.v),
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: _buildUserProfile(
                context,
                fullName: "lbl_full_name3".tr,
                value: "msg_muhammad_tahir_siddiqui".tr,
                value1: "lbl_email".tr,
                email: "msg_xyz_airtechsolutions_com".tr,
                value2: "lbl_phone_no".tr,
                phoneNo: "lbl_92_347_1234567".tr,
              ),
            ),
            SizedBox(height: 5.v),
          ],
        ),
      ),
      bottomNavigationBar: _buildDownloadPass(context),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgHome,
        margin: EdgeInsets.only(
          left: 21.h,
          top: 10.v,
          bottom: 23.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_view_e_pass".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildDownloadPass(BuildContext context) {
    return CustomElevatedButton(
      height: 58.v,
      text: "lbl_download_pass".tr.toUpperCase(),
      margin: EdgeInsets.only(
        left: 21.h,
        right: 20.h,
        bottom: 26.v,
      ),
      buttonStyle: CustomButtonStyles.outlinePrimary,
    );
  }

  /// Common widget
  Widget _buildUserProfile(
    BuildContext context, {
    required String fullName,
    required String value,
    required String value1,
    required String email,
    required String value2,
    required String phoneNo,
  }) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fullName,
            style: TextStyle(
              color: appTheme.black900,
              fontSize: 14.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 7.v),
          Text(
            value,
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 13.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8.v),
          Divider(),
          SizedBox(height: 5.v),
          Text(
            value1,
            style: TextStyle(
              color: appTheme.black900,
              fontSize: 14.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.v),
          Text(
            email,
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 13.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8.v),
          Divider(),
          SizedBox(height: 5.v),
          Text(
            value2,
            style: TextStyle(
              color: appTheme.black900,
              fontSize: 14.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 14.v),
          Text(
            phoneNo,
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 13.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
