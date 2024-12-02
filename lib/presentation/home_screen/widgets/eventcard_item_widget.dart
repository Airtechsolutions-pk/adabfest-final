import 'package:adabfest/data/models/workshopModel/workShopmodel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/GlobalEvents/EventsModals.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_icon_button.dart';
import 'package:adabfest/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

import '../../bookmark_screen/provider/bookmark_provider.dart';
import '../../login_screen/provider/login_provider.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventcardItemWidget extends StatefulWidget {
  EventcardItemWidget(
      this.eventcardItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  final Workshop eventcardItemModelObj;

  @override
  State<EventcardItemWidget> createState() => _EventcardItemWidgetState();
}

class _EventcardItemWidgetState extends State<EventcardItemWidget> {
   SharedPreferences? _prefs;
   String? _bookmarkKey;
  bool isBookmarkFilled = false;

  @override
  void initState() {
    super.initState();
    // checkLoggedInStatus();
    //
   // _bookmarkKey = 'bookmark_${widget.eventcardItemModelObj.eventID}';
   // _initPreferences();
  }

  // Future<void> _initPreferences() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     isBookmarkFilled = _prefs.getBool(_bookmarkKey) ?? false;
  //   });
  // }
  //
  // Future<void> _toggleBookmark(bool newBookmarkState) async {
  //   setState(() {
  //     isBookmarkFilled = newBookmarkState;
  //   });
  //   await _prefs.setBool(_bookmarkKey, newBookmarkState);
  //   if (newBookmarkState) {
  //    // saveEventInWishlist(widget.eventcardItemModelObj);
  //   } else {
  //    // removeEventFromWishlist(widget.eventcardItemModelObj);
  //   }
  // }

  void saveEventInWishlist(Events event) async {
    BookmarkProvider wishlistProvider = BookmarkProvider();
    await wishlistProvider.addToWishlist(event);
  }

  void removeEventFromWishlist(Events event) async {
    BookmarkProvider wishlistProvider = BookmarkProvider();
    await wishlistProvider.removeFromWishlist(event);
  }

  @override
  Widget build(BuildContext context) {
    print("object ${widget.eventcardItemModelObj.name}");
    return GestureDetector(
      onTap: () {
        NavigatorService.pushNamed(
          AppRoutes.eventDetailsScreen,
          arguments: widget.eventcardItemModelObj,
        );
      },
      child: Container(
        width: 210,
        padding: EdgeInsets.all(6.h),
        margin: EdgeInsets.only(left: 10),
        decoration: AppDecoration.outlineBlueGrayF.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: widget.eventcardItemModelObj?.image,
              height: 105,
              fit: BoxFit.cover,
              width: double.infinity,
              radius: BorderRadius.circular(
                10.h,
              ),
              alignment: Alignment.center,
            ),
            SizedBox(height: 5.v),
            Container(
              width: 200.v,
              padding: EdgeInsets.only(left: 7.h,right: 10.h),
              child: Text(
                widget.eventcardItemModelObj.name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 12.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 5.v),
            Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgCalendarDays,
                    height: 12.adaptSize,
                    width: 12.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5.h,
                      top: 2.v,
                    ),
                    child:
                    Text(
                      '${widget.eventcardItemModelObj.finalDate ?? ''} | ${widget.eventcardItemModelObj.startTime  ?? '' } - ${widget.eventcardItemModelObj.endTime  ?? '' }',
                      style: TextStyle(
                        color: theme.colorScheme.primaryContainer,
                        fontSize: 9.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 8.v),
            // Padding(
            //   padding: EdgeInsets.only(left: 4.h),
            //   child: CustomOutlinedButton(
            //
            //     onPressed: () {
            //
            //       if (widget.eventcardItemModelObj.date != null) {
            //         List<String> dateComponents = widget.eventcardItemModelObj.date!.split('-');
            //         if (dateComponents.length == 3) {
            //           int? day = int.tryParse(dateComponents[0]);
            //           int? month = int.tryParse(dateComponents[1]);
            //           int? year = int.tryParse(dateComponents[2]);
            //           if (day != null && month != null && year != null) {
            //             DateTime eventDate = DateTime(year, month, day);
            //             if (eventDate.isAfter(DateTime.now())) {
            //               onTapImgRegis(context, widget.eventcardItemModelObj.statusID);
            //             } else {
            //               Fluttertoast.showToast(
            //                 msg: "Event Date has passed",
            //                 backgroundColor: Colors.red.shade600,
            //                 textColor: Colors.white,
            //                 fontSize: 18.fSize,
            //               );
            //             }
            //           } else {
            //             Fluttertoast.showToast(
            //               msg: "Invalid date format",
            //               backgroundColor: Colors.red.shade600,
            //               textColor: Colors.white,
            //               fontSize: 18.fSize,
            //             );
            //           }
            //         } else {
            //           Fluttertoast.showToast(
            //             msg: "Invalid date format",
            //             backgroundColor: Colors.red.shade600,
            //             textColor: Colors.white,
            //             fontSize: 18.fSize,
            //           );
            //         }
            //       } else {
            //         Fluttertoast.showToast(
            //           msg: "Event Date is not available",
            //           backgroundColor: Colors.red.shade600,
            //           textColor: Colors.white,
            //           fontSize: 18.fSize,
            //         );
            //       }
            //     },
            //     width: 200.h,
            //     text: "lbl_register".tr,
            //     buttonTextStyle: TextStyle(color: Colors.red),
            //     buttonStyle: CustomButtonStyles.inline,
            //
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  onTapImgRegis(BuildContext context, args) async {
    if (await canLaunch(args.toString())) {
    await launch(args.toString());
    } else {
    throw 'Could not launch $args';
    }

  }

  // bool isLoggedIn = false;
  //
  //
  //
  // Future<void> checkLoggedInStatus() async {
  //   bool loggedIn = await LoginProvider().isLoggedIn();
  //   setState(() {
  //     isLoggedIn = loggedIn;
  //   });
  // }
}
