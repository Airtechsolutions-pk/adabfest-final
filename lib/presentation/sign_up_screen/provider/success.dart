import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/data/models/messagemodel/MessageModel.dart';
import 'package:adabfest/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/src/style.dart' as styleshtml;

import '../../../theme/app_decoration.dart';

class MessagePopup1 extends StatelessWidget {

  const MessagePopup1({Key? key,}) : super(key: key);

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
              Text(
                "lbl_congratulation".tr,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 9),
              SizedBox(
                width: 268,
                child: Text(
                  "Thank you for registering for 9AASC Surgical Conference! ".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: 268,
                child: Text(
                  "Please check your registered email. ".tr,
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
              SizedBox(height: 26),

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
