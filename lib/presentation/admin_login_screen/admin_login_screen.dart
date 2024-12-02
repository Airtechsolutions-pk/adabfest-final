import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as JSON;

import 'models/admin_login_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'provider/admin_login_provider.dart';
import 'package:http/http.dart' as http;

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AdminLoginScreenState createState() => AdminLoginScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminLoginProvider(),
      child: AdminLoginScreen(),
    );
  }
}

class AdminLoginScreenState extends State<AdminLoginScreen> {
  int? userid;
  @override
  void initState() {
    super.initState();
  }



  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR'); // Key for QR code scanner


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        width: SizeUtils.width,
        height: SizeUtils.height,
        decoration: BoxDecoration(
          color: theme.colorScheme.onErrorContainer.withOpacity(1),
          image: DecorationImage(
              image: AssetImage(ImageConstant.imgLogin),
              fit: BoxFit.cover),
        ),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 44.h,
            vertical: 11.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 80.v,),
              Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgAgaKhanUniversityLogo99x99,
                    height: 99.adaptSize,
                    width: 99.adaptSize,
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    "".tr.toUpperCase(),
                    style: CustomTextStyles.titleLargeBodoniMTBlack900,
                  ),
                ],
              ),
              SizedBox(height: 71.v),
              Container(
                height: 300,
                width: 300,

                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xffE30512)
                  ),
                  borderRadius: BorderRadius.circular(30)

                ),

                child: GestureDetector(
                  onTap: (){
                    // when i tap on this qr code open and the user data fetch from qr code and send to update api
                    _openQRCodeScanner(context);

                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 15.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgThumbsUpPrimary,
                        height: 90.adaptSize,
                        width: 90.adaptSize,
                      ),
                      SizedBox(height: 35.v),
                      Text(
                        "lbl_scan_qr_code".tr,
                        style: CustomTextStyles.headlineSmallPrimary,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildLogoutButton(context),
    );
  }

  /// Section Widget
  Widget _buildLogoutButton(BuildContext context) {
    return CustomElevatedButton(
      height: 44.v,
      buttonTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 14.fSize
      ),
      onPressed: (){
        NavigatorService.pushNamed(
          AppRoutes.loginScreen,
        );
      },

      text: "lbl_logout".tr.toUpperCase(),
      margin: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
        bottom: 37.v,
      ),
      // leftIcon: Container(
      //   margin: EdgeInsets.only(right: 8.h),
      //   child: CustomImageView(
      //     imagePath: ImageConstant.imgUserOnerrorcontainer,
      //     height: 24.adaptSize,
      //     width: 24.adaptSize,
      //   ),
      // ),
      buttonStyle: CustomButtonStyles.fillPrimaryTL8,
    );
  }

  // Function to open the QR code scanner
  void _openQRCodeScanner(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          child: QRView(
            key: _qrKey,

            onQRViewCreated: _onQRViewCreated,
          ),
        );
      },
    );
  }
  QRViewController? _controller;


// Callback when QR view is created
//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       _controller = controller;
//       _controller!.scannedDataStream.listen((scanData) {
//         print('Scanned data: ${scanData.code}');
//         // Handle the scanned data as desired
//       });
//     });
//   }
// ...

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
      _controller!.scannedDataStream.listen((scanData) {
        print('Scanned data: ${scanData.code}');

        // Extracting data from the scanned result
        List<String> scannedDataList = scanData.code!.split('\n');
        if (scannedDataList.length >= 4) {


          String fullName = scannedDataList[0];
          String email = scannedDataList[1];
          String eventDetails = scannedDataList[3];
          String userid = scannedDataList[5];

          print("object ----->>> %${scannedDataList}");
          print("object ----->>> %${email}");
          print("object ----->>> %${userid}");

          // Making a network request to update attendees
          _updateAttendees(email, fullName, eventDetails,userid);
        }
      });
    });
  }
  //
  // static const String userIdKey = 'userId';
  //
  // Future<int?> getUserId() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getInt(userIdKey);
  // }

  // ...

  void _updateAttendees(String email, String fullName, String eventid,String userid) async {
    // final int? userid = await getUserId(); // Retrieve userid from SharedPreferences

    final url = Uri.parse('http://adabfest-001-site1.gtempurl.com/Event/UpdateAttendees');

    // You may need to replace the placeholders with the actual eventID and userID values
    final requestBody = {

    };

    Map map = {
      "attendeesID": "${userid}", // Convert userid to String
      "fullName": "${fullName.toString()}",
      "email": "${email.toString()}",
      "statusID" : 1
    };

    print("----- request ${map}");

    try {
      final response = await http.post(
        url,
        body: JSON.json.encode(map),
        headers: {
          "Content-Type": "application/json"
        },
      );
      print("{object ${response.body}");
      var data = json.decode(response.body.toString());


      if (data['description'] == 'User is already Present.' ) {
        Fluttertoast.showToast(msg: "Attendee is already present",backgroundColor: Colors.red.shade600,textColor: Colors.white,gravity: ToastGravity.CENTER,);
        AssetsAudioPlayer.newPlayer().open(
          Audio("assets/scan.mp3"),
          autoStart: true,
          showNotification: true,
        );
        print("object ${response.body}");

      } else if( data['description']  == 'Something Went Wrong.') {
        Fluttertoast.showToast(msg: "Failed to update attendees. Status code: ${response.statusCode}",backgroundColor: Colors.red.shade600,textColor: Colors.white,        gravity: ToastGravity.CENTER,
        );

      }else if( data['description']  == 'User is Present.') {

        Fluttertoast.showToast(msg: "Attendee is present",backgroundColor: Colors.red.shade600,textColor: Colors.white,gravity: ToastGravity.CENTER,);
        AssetsAudioPlayer.newPlayer().open(
          Audio("assets/scan.mp3"),
          autoStart: true,
          showNotification: true,
        );
      }
    } catch (error) {
      print('Error updating attendees: $error');
      Fluttertoast.showToast(msg: "Error updating attendees: $error",backgroundColor: Colors.red.shade600,textColor: Colors.white);

    }
  }


}


