import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/payment_screenshot_upload_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'provider/payment_screenshot_upload_provider.dart';
import 'package:http/http.dart' as http;

class PaymentScreenshotUploadScreen extends StatefulWidget {
  const PaymentScreenshotUploadScreen({Key? key}) : super(key: key);

  @override
  PaymentScreenshotUploadScreenState createState() =>
      PaymentScreenshotUploadScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PaymentScreenshotUploadProvider(),
        child: PaymentScreenshotUploadScreen());
  }
}

class PaymentScreenshotUploadScreenState
    extends State<PaymentScreenshotUploadScreen> {
  @override
  void initState() {
    super.initState();
    _loadUploadedImagePath(); // Load the uploaded image path from SharedPreferences

  }

  String? _uploadedImagePath;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
        bottomNavigationBar: Container(
            child:  _uploadedImagePath != null ? _buildUplaodImage(context,) : SizedBox()
        ),
        body: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
              SizedBox(height: 100,),
              _buildChooseFile(context),
              SizedBox(height: 50,),


             _uploadedImagePath != null ?  _buildChooseFileRow(context) : SizedBox(),

            ])));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 58.h,
      backgroundColor: Color(0xffE30512),
      leading: AppbarLeadingImage(
        onTap: (){
          NavigatorService.goBack();
        },
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
            top: 2.v,
            right: 19.h,
            left: 12
        ),
      ),
      styleType: Style.bgFill,
      centerTitle: true,
      title: Text(
        "Upload Screenshot",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20.fSize
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildChooseFile(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: DottedBorder(
            color: appTheme.gray500,
            padding:
                EdgeInsets.only(left: 1.h, top: 1.v, right: 1.h, bottom: 1.v),
            strokeWidth: 1.h,
            radius: Radius.circular(10),
            borderType: BorderType.RRect,
            dashPattern: [6, 6],
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 88.h, vertical: 33.v),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgLetsIconsUpload,
                      height: 36.adaptSize,
                      width: 36.adaptSize),
                  SizedBox(height: 6.v),
                  Opacity(
                      opacity: 0.84,
                      child: Text("lbl_file_upload".tr,
                          style: CustomTextStyles.titleSmallPrimary)),
                  SizedBox(height: 3.v),
                  SizedBox(
                      width: 154.h,
                      child: Text("msg_please_upload_payment".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMediumGray70001
                              .copyWith(height: 1.29))),
                  SizedBox(height: 26.v),
                  CustomElevatedButton(
                    onPressed: _uploadImage,
                      height: 38.v,
                      text: "lbl_choose_file".tr.toUpperCase(),
                      margin: EdgeInsets.only(left: 17.h, right: 15.h),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle:
                          CustomTextStyles.titleSmallOnErrorContainer_1)
                ]))));
  }

  /// Navigates to the homeScreenContainerScreen when the action is triggered.
  onTapImgHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainPage,
    );
  }

  Widget _buildUplaodImage(BuildContext context,) {
    return SizedBox(
      height: 80.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomElevatedButton(
            height: 70.v,
            onPressed: () {

              uploadHttp();
            },
            buttonTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: "Inte",
                fontSize: 18,
                fontWeight: FontWeight.w600),
            width: double.maxFinite,
            text: "Upload".tr.toUpperCase(),
            margin: EdgeInsets.only(bottom: 30.v, left: 30.h, right: 20.h),
            buttonStyle: CustomButtonStyles.outlinePrimary,
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }


  Widget _buildChooseFileRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
        padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 13.v),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4)
        ),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgMajesticonsImageLine,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(top: 1.v)),
          Padding(
              padding: EdgeInsets.only(left: 9.h, top: 5.v, bottom: 2.v),
              child: Text("Screenshot".tr,
                  style: CustomTextStyles.titleSmallPrimary)),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgEyeoffPrimary,
              onTap: () {
                print("objec t  $_uploadedImagePath");
                if (_uploadedImagePath != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          width: double.infinity,
                          height: 300,
                          child: Image.file(
                            File(_uploadedImagePath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(top: 1.v)),
          CustomImageView(
              imagePath: ImageConstant.imgTrash2,
              height: 24.adaptSize,
              onTap: (){
                setState(() {
                  _deleteImage();
                });
              },
              width: 24.adaptSize,
              margin: EdgeInsets.only(left: 20.h, top: 1.v, right: 7.h))
        ]));
  }

  Future<void> _deleteImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('uploadedImagePath'); // Remove the uploaded image path from SharedPreferences
    setState(() {
      _uploadedImagePath = null; // Reset the uploaded image path
    });
  }
  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _uploadedImagePath = pickedFile.path; // Store the path of the uploaded image
      });

      // Save the uploaded image path to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uploadedImagePath', _uploadedImagePath!);
    } else {
      // User canceled the image selection.
    }
  }
  void uploadHttp() async {
    int? userId =
    await Provider.of<PaymentScreenshotUploadProvider>(context, listen: false).getUserId();
    try {
      if (_uploadedImagePath != null) {
        File imageFile = File(_uploadedImagePath!);
        List<int> imageBytes = await imageFile.readAsBytes();
        String base64Image = base64Encode(imageBytes);

        final response = await http.post(
          Uri.parse(''),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'image': base64Image,
            "uid" : userId.toString(),
          }),
        );

        // Handle the response here
        if (response.statusCode == 200) {
          // Image uploaded successfully
          print('Image uploaded successfully');
        } else {
          // Error uploading image
          print('Error uploading image');
        }
      } else {
        print('No image path provided');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }


  Future<void> _loadUploadedImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _uploadedImagePath = prefs.getString('uploadedImagePath');
    });
  }

}
