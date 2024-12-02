import 'dart:typed_data';

import 'package:adabfest/data/models/GlobalEvents/EventsModals.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui; // Import 'dart:ui' with an alias
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_title.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../../../data/models/QRLogin/Qr_login.dart';
import '../../../data/models/myevents/myevents.dart';
import '../models/eventcard3_item_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Eventcard3ItemWidgetaAccept extends StatelessWidget {
  Eventcard3ItemWidgetaAccept(
    this.eventcard3ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Event? eventcard3ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventcard3ItemModelObj!.userName!,
            style: theme.textTheme.labelMedium,
          ),
          SizedBox(height: 4.v),
          Text(
            eventcard3ItemModelObj!.finalDate!,
            style: theme.textTheme.labelMedium,
          ),
          SizedBox(height: 9.v),
          Text(
            eventcard3ItemModelObj!.contactNo!,
            style: theme.textTheme.labelMedium,
          ),
          SizedBox(height: 9.v),

          SizedBox(
            width: 198.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    text: "View Ticket".tr,
                    onPressed: (){
                      onTapDoctorReviews(context,eventcard3ItemModelObj! );

                    },
                    margin: EdgeInsets.only(right: 3.h),

                  ),
                ),
                // Expanded(
                //   child: CustomOutlinedButton(
                //     text: "Download".tr,
                //     margin: EdgeInsets.only(left: 3.h),
                //     onPressed: (){
                //       _downloadPassPDF(context,eventcard3ItemModelObj);
                //     },
                //
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapDoctorReviews(BuildContext context,Event args) {
    NavigatorService.pushNamed(
        AppRoutes.myevent_detials,
        arguments: args
    );
  }


  Future<Uint8List> _generateQRCodeImage(String data) async {
    final qrPainter = QrPainter(
      data: data,
      version: QrVersions.auto,
    );

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    qrPainter.paint(canvas, Size(200, 200)); // Adjust the size

    final picture = recorder.endRecording();
    final img = await picture.toImage(200, 200); // Adjust the size
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

}





class Eventcard3ItemWidgetPending extends StatelessWidget {
  Eventcard3ItemWidgetPending(
      this.eventcard3ItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  Event eventcard3ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [

          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              top: 2.v,
              bottom: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventcard3ItemModelObj.finalDate!,
                  style: theme.textTheme.labelMedium,
                ),
                SizedBox(height: 4.v),

                SizedBox(height: 9.v),
                SizedBox(
                  width: 98.h,
                  child: CustomOutlinedButton(
                    text: "Registered".tr,
                    onPressed: (){
                      onTapDoctorReviewsPending( context);

                    },
                    decoration: BoxDecoration(
                      color: Color(0xffE30512).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    buttonTextStyle:         theme.textTheme.labelMedium,
                    buttonStyle: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0), // Adjust the value as per your requirement
                        ),
                      ),

                      side: MaterialStateProperty.all(BorderSide(color: Colors.transparent),),
                    ),



                    margin: EdgeInsets.only(right: 3.h),

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapDoctorReviews(BuildContext context,Event args) {
    NavigatorService.pushNamed(
        AppRoutes.myevent_detials,
        arguments: args
    );
  }

  onTapDoctorReviewsPending(BuildContext context,) {
    NavigatorService.pushNamed(
        AppRoutes.paymentScreenshotUploadScreen,
    );
  }


}


class Eventcard3ItemWidgetReject extends StatelessWidget {
  Eventcard3ItemWidgetReject(
      this.eventcard3ItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  Event eventcard3ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [

          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              top: 2.v,
              bottom: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 4.v),
                SizedBox(
                  width: 171.h,
                  child: Text(
                    eventcard3ItemModelObj.userName!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall!.copyWith(
                      height: 1.29,
                    ),
                  ),
                ),
                SizedBox(height: 9.v),
                SizedBox(
                  width: 98.h,
                  child: CustomOutlinedButton(
                    text: "Rejected".tr,
                    onPressed: (){

                    //  Fluttertoast.showToast(msg: "You")

                    },
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4)
                    ),
                    buttonTextStyle: TextStyle(
                      color: Colors.red.shade900
                    ),
                    buttonStyle: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0), // Adjust the value as per your requirement
                        ),
                      ),

                      side: MaterialStateProperty.all(BorderSide(color: Colors.transparent),),
                    ),



                    margin: EdgeInsets.only(right: 3.h),

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapDoctorReviews(BuildContext context,Event args) {
    NavigatorService.pushNamed(
        AppRoutes.myevent_detials,
        arguments: args
    );
  }

  onTapDoctorReviewsPending(BuildContext context,) {
    NavigatorService.pushNamed(
      AppRoutes.paymentScreenshotUploadScreen,
    );
  }


}
