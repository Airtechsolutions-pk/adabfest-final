import 'package:adabfest/data/models/GlobalEvents/EventsModals.dart';
import 'package:adabfest/presentation/bookmark_screen/provider/bookmark_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../login_screen/provider/login_provider.dart';
import '../models/eventcardlist1_item_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Eventcardlist1ItemWidget extends StatefulWidget {
  Eventcardlist1ItemWidget(
    this.eventcardlist1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Events eventcardlist1ItemModelObj;

  @override
  State<Eventcardlist1ItemWidget> createState() =>
      _Eventcardlist1ItemWidgetState();
}

class _Eventcardlist1ItemWidgetState extends State<Eventcardlist1ItemWidget> {
  @override
  Widget build(BuildContext context) {
    BookmarkProvider bookmarkProvider = Provider.of<BookmarkProvider>(context);

    return GestureDetector(
      onTap: () {
        NavigatorService.pushNamed(
          AppRoutes.eventDetailsScreen,
          arguments: widget.eventcardlist1ItemModelObj,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade500,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                CustomImageView(
                  imagePath: widget.eventcardlist1ItemModelObj?.image,
                  height: 92.adaptSize,
                  width: 92.adaptSize,
                  radius: BorderRadius.circular(
                    6.h,
                  ),
                  margin: EdgeInsets.only(bottom: 1.v),
                ),
                GestureDetector(
                  onTap: () {},
                  child: CustomImageView(
                    // Use the appropriate image path based on the wishlist status
                    imagePath: bookmarkProvider.bookmark!
                        ? ImageConstant.imgFilledBookmark
                        : ImageConstant.imgBookmarkGray500,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 2.v,
                bottom: 1.v,
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
                            widget.eventcardlist1ItemModelObj.eventTime!,
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgUserRed500,
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
                      widget.eventcardlist1ItemModelObj.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall!.copyWith(
                        height: 1.29,
                      ),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  CustomOutlinedButton(
                    width: 80.h,
                    text: "lbl_register".tr,
                    onPressed: () {
                      List<String> dateComponents = widget
                          .eventcardlist1ItemModelObj.eventDate!
                          .split('-');

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
                            onTapImgRegis(
                                context, widget.eventcardlist1ItemModelObj);
                          } else {
                            // If the event date has passed, show a toast message
                            Fluttertoast.showToast(
                                msg: "Event Date has passed",
                                backgroundColor: Colors.red.shade600,
                                textColor: Colors.white,
                                fontSize: 18.fSize);
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: "Invalid date format",
                              backgroundColor: Colors.red.shade600,
                              textColor: Colors.white,
                              fontSize: 18.fSize);
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Invalid date format",
                            backgroundColor: Colors.red.shade600,
                            textColor: Colors.white,
                            fontSize: 18.fSize);
                      }
                    },
                    buttonTextStyle: TextStyle(color: Color(0xffFF4040)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapImgRegis(BuildContext context, args) {
   NavigatorService.pushNamed(AppRoutes.registrationScreen,
            arguments: args);
  }


}
