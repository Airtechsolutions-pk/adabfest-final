import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:io';
import 'dart:ui' as ui; // Import 'dart:ui' with an alias
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../data/models/QRLogin/Qr_login.dart';
import '../../data/models/registarModel/registar_model.dart';
import 'models/e_pass_downlaod_two_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_title.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'provider/e_pass_downlaod_two_provider.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
class EPassDownlaodTwoScreen extends StatefulWidget {
  const EPassDownlaodTwoScreen({Key? key}) : super(key: key);

  @override
  EPassDownlaodTwoScreenState createState() => EPassDownlaodTwoScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EPassDownlaodTwoProvider(),
        child: EPassDownlaodTwoScreen());
  }
}

class EPassDownlaodTwoScreenState extends State<EPassDownlaodTwoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int? userId =
          await Provider.of<EPassDownlaodTwoProvider>(context, listen: false)
              .getUserId();

      Provider.of<EPassDownlaodTwoProvider>(context, listen: false)
          .calluserapi(onSuccess: () {}, onError: () {}, uid: userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.gray100,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(child: Consumer<EPassDownlaodTwoProvider>(
            builder: (context, moreProvider, _) {
              if (moreProvider.getqr.isNotEmpty) {
              final fullName = moreProvider.getqr[0].qr?.fullName ?? "";
              final email = moreProvider.getqr[0].qr?.email ?? "";
              final phone = moreProvider.getqr[0].qr?.phoneNo ?? "";
              final venue = moreProvider.getqr[0].qr?.eventName ?? "";
              final eventid = moreProvider.getqr[0].qr?.eventID ?? "";
              final eventuserid = moreProvider.getqr[0].qr?.eventUserID ?? "";

              final date = moreProvider.getqr[0].qr?.finalDate ?? "";

              final qrCodeData = "$fullName\n$email\n$phone\n$venue\n$date\n$eventid\n$eventuserid";

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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: fs.Svg(ImageConstant.imgGroup34119),
                                fit: BoxFit.cover)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: qrCodeWidget),
                              SizedBox(height: 8.v),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15.v),
                                    child: Text("Event ID #${moreProvider.getqr[0].qr?.eventID}".tr,
                                        style: TextStyle(
                                            color: appTheme.black900,
                                            fontSize: 14.fSize,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400)),
                                  )),
                              SizedBox(height: 32.v),
                              Text("lbl_full_name3".tr,
                                  style: TextStyle(
                                      color: appTheme.gray700,
                                      fontSize: 14.fSize,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400)),
                              SizedBox(height: 10.v),
                              Text("${moreProvider.getqr[0].qr?.fullName ?? ""}".tr,
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
                              Text("${moreProvider.getqr[0].qr?.email ?? ""}".tr,
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
                              Text("${moreProvider.getqr[0].qr?.phoneNo ?? ""}".tr,
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
                              Text("${moreProvider.getqr[0].qr?.eventName ?? ""}".tr,
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
                              Text("${moreProvider.getqr[0].qr?.finalDate ?? ""}".tr,
                                  style: TextStyle(
                                      color: theme.colorScheme.onPrimary,
                                      fontSize: 14.fSize,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 9.v)
                            ]))
                  ]));


            }else{
              return Container(
                alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 200),
                  child: CircularProgressIndicator(color: Colors.red,)); // or any other loading indicator

            }
        })),
        bottomNavigationBar:  Consumer<EPassDownlaodTwoProvider>(
            builder: (context, moreProvider, _) { return _buildDownloadPass(context , moreProvider.getqr[0]);}));
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

  Future<void> _downloadPassPDF(BuildContext context, QRLogin moreProvider) async {
    final fullName = moreProvider.qr?.fullName ?? "";
    final email = moreProvider.qr?.email ?? "";
    final phone = moreProvider.qr?.phoneNo ?? "";
    final venue = moreProvider.qr?.eventName ?? "";
    final eventid = moreProvider.qr?.eventID ?? "";
    final eventuserid = moreProvider.qr?.eventUserID ?? "";

    final date = moreProvider.qr?.finalDate ?? "";
    print("---->> ${moreProvider.qr?.eventID}");
    // Generate QR code and save as an image
    final qrImageData = await _generateQRCodeImage('$fullName\n$email\n$phone\n$venue\n$date\n$eventid\n$eventuserid');

    // Generate PDF
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Center(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Image(pw.MemoryImage(qrImageData), width: 250, height: 250),
              pw.SizedBox(height: 10),

              pw.Text('Full Name: $fullName',style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),

              pw.Text('Email: $email',style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),

              pw.Text('Phone: $phone',style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),

              pw.Text('Venue: $venue',style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),
              pw.Text('Date: $eventuserid',style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold)),

              pw.Text('Date: $date',style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold)),
            ],
          ),
        )
      ),
    );

    final Uint8List pdfBytes = await pdf.save();

    // Use path_provider to get the documents directory
    final directory = await getExternalStorageDirectory(); // Use getExternalStorageDirectory for public storage access
    final filePath = '${directory!.path}/pass.pdf'; // Check for nullability

    // Save PDF
    File pdfFile = File(filePath);
    await pdfFile.writeAsBytes(pdfBytes);

    // Open the generated PDF file using open_file
    await OpenFile.open(filePath);
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

  /// Section Widget
  Widget _buildDownloadPass(BuildContext context, QRLogin moreProvider ) {
    return CustomElevatedButton(
        height: 58.v,
        onPressed: () => _downloadPassPDF(context,moreProvider),

        text: "lbl_download_pass".tr.toUpperCase(),
        buttonTextStyle: TextStyle(color: Colors.white, fontSize: 18.fSize),
        margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 26.v),
        buttonStyle: CustomButtonStyles.outlinePrimary);
  }

  /// Navigates to the homeScreen when the action is triggered.
  onTapHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainPage,
    );
  }
}
