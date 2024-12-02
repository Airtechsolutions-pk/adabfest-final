import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../theme/app_decoration.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_outlined_button.dart';

class LogoutPop extends StatefulWidget {
  const LogoutPop({Key? key}) : super(key: key);

  @override
  State<LogoutPop> createState() => _LogoutPopState();
}

class _LogoutPopState extends State<LogoutPop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.h,
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 27.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgThumbsUp,
            height: 65.v,
            width: 55.h,
          ),
          SizedBox(height: 29.v),
          Container(
            width: 245.h,
            margin: EdgeInsets.only(
              left: 15.h,
              right: 13.h,
            ),
            child: Text(
              "msg_are_you_sure_you_log".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumBlack900.copyWith(
                height: 1.50,
              ),
            ),
          ),
          SizedBox(height: 17.v),
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlinedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  height: 44.v,
                  width: 133.h,
                  text: "lbl_close".tr,
                  buttonStyle: CustomButtonStyles.outlineGrayTL6,
                  buttonTextStyle: CustomTextStyles.titleSmallPrimary,
                ),
                CustomElevatedButton(
                  height: 44.v,
                  onPressed: (){
                    delteLoggedInStatus();
                    NavigatorService.pushNamedAndRemoveUntil(
                      AppRoutes.loginScreen,
                    );
                  },
                  width: 132.h,
                  text: "Logout".tr,
                  buttonStyle: CustomButtonStyles.fillRedA,
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static const String loggedInKey = 'isLoggedIn';
  static const String userIdKey = 'userId';
  Future<Future<bool>> delteLoggedInStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(loggedInKey);
    // GoogleAuthHelper authHelper = GoogleAuthHelper();
    // authHelper.googleSignOutProcess();
    return prefs.remove(userIdKey);

  }
}
