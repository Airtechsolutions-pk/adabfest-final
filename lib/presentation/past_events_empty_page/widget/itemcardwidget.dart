
// ignore: must_be_immutable
import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/models/GlobalEvents/EventsModals.dart';
import '../../../theme/app_decoration.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../../login_screen/provider/login_provider.dart';

class Eventcard4ItemWidget extends StatefulWidget {
  Eventcard4ItemWidget(
      this.eventcard3ItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  Events eventcard3ItemModelObj;

  @override
  State<Eventcard4ItemWidget> createState() => _Eventcard4ItemWidgetState();
}

class _Eventcard4ItemWidgetState extends State<Eventcard4ItemWidget> {
  @override
  Widget build(BuildContext context) {
    print("--------?>>>> ${widget.eventcard3ItemModelObj?.image}");
    return GestureDetector(
      onTap: (){
        NavigatorService.pushNamed(
          AppRoutes.eventDetailsScreen,
          arguments: widget.eventcard3ItemModelObj,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.v),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomImageView(
              imagePath: widget.eventcard3ItemModelObj?.image,
              height: 92.adaptSize,
              width: 92.adaptSize,
              fit: BoxFit.cover,

              radius: BorderRadius.circular(
                6.h,
              ),
              margin: EdgeInsets.only(bottom: 1.v),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 2.v,
                bottom: 3.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 211.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 3.v),
                          child: Text(
                            '${widget.eventcard3ItemModelObj?.eventDate ?? ""}${widget.eventcard3ItemModelObj?.eventTime ?? ""}',
                            style: TextStyle(
                              color: theme.colorScheme.primaryContainer,
                              fontSize: 10.fSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        CustomImageView(
                          imagePath: ImageConstant.imgBookmarkGray500,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.v),
                  SizedBox(
                    width: 171.h,
                    child: Text(
                      widget.eventcard3ItemModelObj.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: appTheme.black900,
                        fontSize: 14.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  CustomOutlinedButton(
                    onPressed: (){
                      if (widget.eventcard3ItemModelObj != null) {
                        // Split the date string into day, month, and year components
                        List<String> dateComponents = widget.eventcard3ItemModelObj.eventDate!.split('-');

                        // Ensure we have three components (day, month, year)
                        if (dateComponents.length == 3) {
                          int? day = int.tryParse(dateComponents[0]);
                          int? month = int.tryParse(dateComponents[1]);
                          int? year = int.tryParse(dateComponents[2]);

                          if (day != null && month != null && year != null) {
                            // Create a DateTime object using the parsed components
                            DateTime eventDate = DateTime(year, month, day);

                            // Check if the event date is after the current date and time
                            if (eventDate.isAfter(DateTime.now())) {
                              // If the event date is in the future, allow registration
                              onTapImgRegis(context,widget.eventcard3ItemModelObj);
                            } else {
                              // If the event date has passed, show a toast message
                              Fluttertoast.showToast(msg: "Event Date has passed",backgroundColor: Colors.red.shade600,textColor: Colors.white,fontSize: 18.fSize);
                            }
                          } else {
                            Fluttertoast.showToast(msg: "Invalid date format",backgroundColor: Colors.red.shade600,textColor: Colors.white,fontSize: 18.fSize);
                          }
                        } else {
                          Fluttertoast.showToast(msg: "Invalid date format",backgroundColor: Colors.red.shade600,textColor: Colors.white,fontSize: 18.fSize);
                        }
                      } else {
                        // If the event date is null, show a toast message
                        Fluttertoast.showToast(msg: "Event Date is not available",backgroundColor: Colors.red.shade600,textColor: Colors.white,fontSize: 18.fSize);
                      }
                      },
                    width: 80.h,
                    text: "lbl_register".tr,
                    buttonTextStyle: TextStyle(color:Color(0xffFF4040)),

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapImgRegis(BuildContext context,args) {
      NavigatorService.pushNamed(
        AppRoutes.registrationScreen,
        arguments: args
    );
  }

  // bool isLoggedIn = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   checkLoggedInStatus();
  //
  // }
  //
  // Future<void> checkLoggedInStatus() async {
  //   bool loggedIn = await LoginProvider().isLoggedIn();
  //   setState(() {
  //     isLoggedIn = loggedIn;
  //   });

}


