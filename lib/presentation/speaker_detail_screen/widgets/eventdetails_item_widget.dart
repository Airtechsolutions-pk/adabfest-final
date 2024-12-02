import '../models/eventdetails_item_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_icon_button.dart';
import 'package:adabfest/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore: must_be_immutable
class EventdetailsItemWidget extends StatelessWidget {
  EventdetailsItemWidget(
    this.eventdetailsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  EventdetailsItemModel eventdetailsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.h),
      margin: EdgeInsets.only(left: 12),
      decoration: AppDecoration.outlineBlueGrayF.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      width: 237.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.all(0),
            color: appTheme.orange200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Container(
              height: 131.v,
              width: 218.h,
              decoration: AppDecoration.fillOrange.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
                image: DecorationImage(
                  image: fs.Svg(
                    ImageConstant.imgGroup431,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CustomImageView(
                    imagePath: eventdetailsItemModelObj?.eventName,
                    height: 131.v,
                    width: 218.h,
                    radius: BorderRadius.circular(
                      10.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.v,
                      right: 8.h,
                    ),
                    child: CustomIconButton(
                      height: 30.adaptSize,
                      width: 30.adaptSize,
                      padding: EdgeInsets.all(7.h),
                      decoration: IconButtonStyleHelper.fillOnErrorContainerTL7,
                      alignment: Alignment.topRight,
                      child: CustomImageView(
                        imagePath: eventdetailsItemModelObj?.bookmarkIcon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(left: 7.h),
            child: Text(
              eventdetailsItemModelObj.eventName1!,
              style: TextStyle(
                color: appTheme.black900,
                fontSize: 16.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCalendarDays,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.only(bottom: 1.v),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.h,
                    top: 2.v,
                  ),
                  child: Text(
                    eventdetailsItemModelObj.eventTime!,
                    style: TextStyle(
                      color: theme.colorScheme.primaryContainer,
                      fontSize: 12.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.v),
                  child: Text(
                    eventdetailsItemModelObj.viewDetailsText!,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 12.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomOutlinedButton(
                  width: 80.h,
                  text: "lbl_register".tr,
                  margin: EdgeInsets.only(left: 59.h),
                  buttonTextStyle: TextStyle(color: Colors.white),
                  buttonStyle: CustomButtonStyles.outlineRed,
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
        ],
      ),
    );
  }
}
