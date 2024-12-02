
import 'package:lottie/lottie.dart';

import 'models/congratulation_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:adabfest/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'provider/congratulation_provider.dart';

// class CongratulationDialog extends StatefulWidget {
//   const CongratulationDialog({Key? key}) : super(key: key);
//
//   @override
//   CongratulationDialogState createState() => CongratulationDialogState();
//
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (context) => CongratulationProvider(),
//         child: CongratulationDialog());
//   }
// }
//
// class CongratulationDialogState extends State<CongratulationDialog> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 333.h,
//         padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 23.v),
//         decoration: AppDecoration.fillOnErrorContainer
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
//         child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//
//               SizedBox(height: 3.v),
//               Text("lbl_congratulation".tr,
//                   style: TextStyle(
//                       color: theme.colorScheme.primary,
//                       fontSize: 24.fSize,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w600)),
//               SizedBox(height: 9.v),
//               SizedBox(
//                   width: 268.h,
//                   child: Text("msg_horem_ipsum_dolor".tr,
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: theme.colorScheme.onPrimary,
//                           fontSize: 13.fSize,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w400))),
//               SizedBox(height: 26.v),
//               CustomElevatedButton(
//                   height: 58.v,
//                   text: "lbl_view_e_pass".tr.toUpperCase(),
//                   buttonTextStyle: TextStyle(
//                     color: Colors.white
//                   ),
//                   buttonStyle: CustomButtonStyles.outlinePrimary,
//                   onPressed: () {
//                     onTapViewEPass(context);
//                   }),
//               SizedBox(height: 10.v),
//               CustomOutlinedButton(
//                   height: 58.v,
//                   text: "lbl_cancel".tr.toUpperCase(),
//                   buttonStyle: CustomButtonStyles.outlineGrayTL10,
//                   onPressed: () {
//                     onTapCancel(context);
//                   })
//             ]));
//   }
//
//   /// Navigates to the ePassDownlaodTwoScreen when the action is triggered.
//   onTapViewEPass(BuildContext context) {
//     NavigatorService.pushNamed(
//       AppRoutes.epassDownlaodtwoScreen,
//     );
//   }
//
//   /// Navigates to the homeScreen when the action is triggered.
//   onTapCancel(BuildContext context) {
//     NavigatorService.pushNamed(
//       AppRoutes.homeScreen,
//     );
//   }
// }
//


class CongratulationDialog extends StatefulWidget {

  const CongratulationDialog({Key? key}) : super(key: key);

  @override
  CongratulationDialogState createState() => CongratulationDialogState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CongratulationProvider(),
        child: CongratulationDialog());
  }
}

class CongratulationDialogState extends State<CongratulationDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 333,
      padding: EdgeInsets.symmetric(horizontal: 31, vertical: 23),
      decoration: AppDecoration.fillOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -180, // Adjust this value to control the overflow amount
            left: 0,
            right: 0,
            child: Lottie.asset("assets/images/animation.json"),
          ),
          Column(
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
                  "msg_horem_ipsum_dolor".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 26),
              CustomElevatedButton(
                height: 58,
                text: "lbl_view_e_pass".tr.toUpperCase(),
                buttonTextStyle: TextStyle(color: Colors.white),
                buttonStyle: CustomButtonStyles.outlinePrimary,
                onPressed: () {
                  onTapViewEPass(context);
                },
              ),
              SizedBox(height: 10),
              CustomOutlinedButton(
                height: 58,
                text: "lbl_cancel".tr.toUpperCase(),
                buttonStyle: CustomButtonStyles.outlineGrayTL10,
                onPressed: () {
                  onTapCancel(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Navigates to the ePassDownlaodTwoScreen when the action is triggered.
  onTapViewEPass(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.my_events,
    );
  }

  /// Navigates to the homeScreen when the action is triggered.
  onTapCancel(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainPage,
    );
  }

}


