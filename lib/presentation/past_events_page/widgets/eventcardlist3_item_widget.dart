import '../models/eventcardlist3_item_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Eventcardlist3ItemWidget extends StatelessWidget {
  Eventcardlist3ItemWidget(
    this.eventcardlist3ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Eventcardlist3ItemModel eventcardlist3ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.v),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: eventcardlist3ItemModelObj?.eventDate,
            height: 92.adaptSize,
            width: 92.adaptSize,
            radius: BorderRadius.circular(
              6.h,
            ),
            margin: EdgeInsets.only(bottom: 1.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 2.v,
              bottom: 37.v,
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
                          eventcardlist3ItemModelObj.eventTime!,
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
                    eventcardlist3ItemModelObj.eventName!,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
