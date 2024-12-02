
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/theme/app_decoration.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_outlined_button.dart';

class ForgetPass extends StatelessWidget {

  const ForgetPass({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      contentPadding: EdgeInsets.zero, // Remove default padding
      insetPadding: EdgeInsets.symmetric(horizontal: 14.0), // Adjust horizontal inset padding

      content: SingleChildScrollView(
        child:  Container(
          width: 333,
          padding: EdgeInsets.symmetric(horizontal: 31, vertical: 23),
          decoration: AppDecoration.fillOnErrorContainer.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.forget,
                height: 65.v,
                width: 55.h,
              ),
              SizedBox(height: 10,),

              Text(
                "Password Sent".tr,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 20,),
              SizedBox(
                width: 268,
                child: Text(
                  "A new password has been sent to you. Please check your registered email.".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 25),

              CustomOutlinedButton(
                height: 58,
                text: "OK".tr.toUpperCase(),
                buttonTextStyle: TextStyle(color: Colors.white,fontSize: 16.fSize),
                buttonStyle: CustomButtonStyles.outlinePrimary,
                onPressed: () {
                  NavigatorService.pushNamedAndRemoveUntil(
                    AppRoutes.loginScreen,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPassError extends StatelessWidget {

  const ForgetPassError({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      contentPadding: EdgeInsets.zero, // Remove default padding
      insetPadding: EdgeInsets.symmetric(horizontal: 14.0), // Adjust horizontal inset padding

      content: SingleChildScrollView(
        child:  Container(
          width: 333,
          padding: EdgeInsets.symmetric(horizontal: 31, vertical: 23),
          decoration: AppDecoration.fillOnErrorContainer.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.forget,
                height: 65.v,
                width: 55.h,
              ),
              SizedBox(height: 10,),

              Text(
                "Oops! Unregistered Email".tr,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 21,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 20,),
              SizedBox(
                width: 268,
                child: Text(
                  "Please sign-up before proceeding.".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 25),

              CustomOutlinedButton(
                height: 58,
                text: "OK".tr.toUpperCase(),
                buttonTextStyle: TextStyle(color: Colors.white,fontSize: 16.fSize),
                buttonStyle: CustomButtonStyles.outlinePrimary,
                onPressed: () {
                  NavigatorService.pushNamedAndRemoveUntil(
                    AppRoutes.loginScreen,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
