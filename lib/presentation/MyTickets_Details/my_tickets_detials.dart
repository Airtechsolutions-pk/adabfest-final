

import 'package:adabfest/data/models/myevents/myevents.dart';
import 'package:flutter/material.dart';
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
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/QRLogin/Qr_login.dart';
import '../../data/models/registarModel/registar_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_title.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../my_tickets_screen/provider/my_tickets_provider.dart';

class MyTickets_Details extends StatefulWidget {
  const MyTickets_Details({Key? key}) : super(key: key);

  @override
  MyTickets_DetailsState createState() => MyTickets_DetailsState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyTicketsProvider(),
        child: MyTickets_Details());
  }
}

class MyTickets_DetailsState extends State<MyTickets_Details> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Event?;

    return Scaffold(
        backgroundColor: appTheme.gray100,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(child: Consumer<MyTicketsProvider>(
            builder: (context, moreProvider, _) {
                final fullName = args?.userName ?? "";
                final email =  "adabfest@gmail.com";
                final phone = args?.contactNo ?? "";
                final venue =  "Adab Fest";
               // final eventid = args.eventID ?? "";
                final eventuserid = args?.userID ?? "";

                final date = args?.createdDate ?? "";

                final qrCodeData = "$fullName\n$email\n$phone\n$venue\n$date\n$eventuserid";

                final qrCodeWidget = QrImageView(
                  data: qrCodeData,
                  version: QrVersions.auto,

                  size: 143, // Adjust the size as needed
                );


                return SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(height: 25.v),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.h),
                          padding:
                          EdgeInsets.symmetric(horizontal: 20.h, vertical: 13.v),
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: fs.Svg(ImageConstant.imgGroup34119),
                          //         fit: BoxFit.cover)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: qrCodeWidget),
                                // SizedBox(height: 8.v),
                                // Align(
                                //     alignment: Alignment.bottomCenter,
                                //     child: Padding(
                                //       padding: EdgeInsets.only(top: 15.v),
                                //       child: Text("9ASC".tr,
                                //           style: TextStyle(
                                //               color: appTheme.black900,
                                //               fontSize: 14.fSize,
                                //               fontFamily: 'Inter',
                                //               fontWeight: FontWeight.w400)),
                                //     )),
                                SizedBox(height: 32.v),
                                Text("lbl_full_name3".tr,
                                    style: TextStyle(
                                        color: appTheme.gray700,
                                        fontSize: 14.fSize,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 10.v),
                                Text("${args?.userName ?? ""}".tr,
                                    style: TextStyle(
                                        color: theme.colorScheme.onPrimary,
                                        fontSize: 20.fSize,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700)),
                                SizedBox(height: 14.v),
                                Text("lbl_email".tr,
                                    style: TextStyle(
                                        color: appTheme.gray700,
                                        fontSize: 14.fSize,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 10.v),
                                Text("Adabfest@gmail.com".tr,
                                    style: TextStyle(
                                        color: theme.colorScheme.onPrimary,
                                        fontSize: 20.fSize,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700)),
                                SizedBox(height: 14.v),
                                Text("lbl_phone_no".tr,
                                    style: TextStyle(
                                        color: appTheme.gray700,
                                        fontSize: 14.fSize,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 8.v),
                                Text("${args?.contactNo ?? ""}".tr,
                                    style: TextStyle(
                                        color: theme.colorScheme.onPrimary,
                                        fontSize: 20.fSize,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700)),
                                SizedBox(height: 20.v),
                                Divider(),
                                SizedBox(height: 19.v),
                                Text("lbl_event".tr,
                                    style: TextStyle(
                                        color: appTheme.gray700,
                                        fontSize: 14.fSize,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 6.v),
                                Text("Adab Fest".tr,
                                    style: TextStyle(
                                        color: theme.colorScheme.onPrimary,
                                        fontSize: 14.fSize,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 18.v),
                                Text("lbl_date_time".tr,
                                    style: TextStyle(
                                        color: appTheme.gray700,
                                        fontSize: 14.fSize,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 6.v),
                                Text("${args?.finalDate ?? ""}".tr,
                                    style: TextStyle(
                                        color: theme.colorScheme.onPrimary,
                                        fontSize: 14.fSize,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 20.v),

                                SizedBox(height: 9.v)
                              ]))
                    ]));



            })));

  }
  void launchZoomLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle the case when the Zoom link cannot be launched
      Fluttertoast.showToast(msg: "Error Occured");
    }
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        backgroundColor: Color(0xffE30512),
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgHome,
            margin: EdgeInsets.only(left: 21.h, top: 10.v, bottom: 23.v),
            onTap: () {
              onTapHome(context);
            }),
        centerTitle: true,
        title: AppbarTitle(
          text: "lbl_view_e_pass".tr,
          margin: EdgeInsets.only(bottom: 10.v),
        ),
        styleType: Style.bgFill);
  }


  /// Section Widget

  /// Navigates to the homeScreen when the action is triggered.
  onTapHome(BuildContext context) {
    NavigatorService.goBack();
  }
}
