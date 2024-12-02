import 'package:fluttertoast/fluttertoast.dart';

import 'models/admin_login_one_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:adabfest/widgets/custom_pin_code_text_field.dart';
import 'package:flutter/material.dart';
import 'provider/admin_login_one_provider.dart';

class AdminLoginOneScreen extends StatefulWidget {
  const AdminLoginOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AdminLoginOneScreenState createState() => AdminLoginOneScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminLoginOneProvider(),
      child: AdminLoginOneScreen(),
    );
  }
}

class AdminLoginOneScreenState extends State<AdminLoginOneScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: SizeUtils.width,
        height: SizeUtils.height,
        decoration: BoxDecoration(
            color: theme.colorScheme.onErrorContainer.withOpacity(1),
            image: DecorationImage(
                image: AssetImage(ImageConstant.imgLogin),
                fit: BoxFit.cover),
        ),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 11.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 80.v,),
              Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgAgaKhanUniversityLogo99x99,
                    height: 99.adaptSize,
                    width: 99.adaptSize,
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    "".tr.toUpperCase(),
                    style: CustomTextStyles.titleLargeBodoniMTBlack900,
                  ),
                ],
              ),
              SizedBox(height: 70.v),
              _buildAdminLoginOtpView(context),
              SizedBox(height: 50.v),
              _buildGoToMain(context),

            ],
          ),
        ),
      ),
    //  bottomNavigationBar: _buildGoToMain(context),
    );
  }

  /// Section Widget
  Widget _buildAdminLoginOtpView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              "lbl_admin_login".tr,
              style: theme.textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: 12.v),
          Selector<AdminLoginOneProvider, TextEditingController?>(
            selector: (
              context,
              provider,
            ) =>
                provider.otpController,
            builder: (context, otpController, child) {
              return CustomPinCodeTextField(
                context: context,
                controller: otpController,
                onChanged: (value) async {
                  otpController?.text = value;
                  if (value.length == 4) {
                    // Automatically validate and navigate when 4 digits are entered
                    if (await Provider.of<AdminLoginOneProvider>(context, listen: false).validateAndCallApi()) {
                      NavigatorService.pushNamed(
                        AppRoutes.adminloginscreen,
                      );
                    } else {
                      // Handle invalid OTP, show a message or perform any other action
                     Fluttertoast.showToast(msg: "Invalid Password",backgroundColor: Colors.red.shade500,fontSize: 14,);
                    }
                  }
                },


              );
            },
          ),

        ],
      ),
    );
  }

  bool validateOTP(BuildContext context) {
    String enteredOTP = Provider.of<AdminLoginOneProvider>(context, listen: false).otpController.text;
    String actualOTP = "1234"; // Replace with the actual OTP to validate against

    // Check if entered OTP matches the actual OTP
    if (enteredOTP == actualOTP) {
      // OTP is valid
      return true;
    } else {
      // OTP is not valid
      return false;
    }
  }


  /// Section Widget
  Widget _buildGoToMain(BuildContext context) {
    return CustomElevatedButton(
      height: 44.v,
      text: "lbl_go_to_main".tr.toUpperCase(),
      buttonTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600
      ),
      onPressed: (){
      NavigatorService.goBack();
      },
      margin: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
        bottom: 37.v,
      ),
      // leftIcon: Container(
      //   margin: EdgeInsets.only(right: 8.h),
      //   child: CustomImageView(
      //     imagePath: ImageConstant.imgRihomeline,
      //     height: 24.adaptSize,
      //     width: 24.adaptSize,
      //   ),
      // ),
      buttonStyle: CustomButtonStyles.fillPrimaryTL8,
    );
  }
}
