import 'package:adabfest/data/models/GlobalEvents/EventsModals.dart';
import 'package:adabfest/data/models/workshopModel/workShopmodel.dart';
import 'package:adabfest/presentation/login_screen/provider/login_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bookmark_screen/provider/bookmark_provider.dart';
import 'models/event_details_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton_two.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:adabfest/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'provider/event_details_provider.dart';
import 'package:flutter_html/src/style.dart' as styleshtml;

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  EventDetailsScreenState createState() => EventDetailsScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventDetailsProvider(),
      child: EventDetailsScreen(),
    );
  }
}

class EventDetailsScreenState extends State<EventDetailsScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoggedInStatus();
  }

  Future<void> checkLoggedInStatus() async {
    bool loggedIn = await LoginProvider().isLoggedIn();
    setState(() {
      isLoggedIn = loggedIn;
    });
  }
  //
  // bool isBookmarkFilled = false; // Initial state is unfilled
  // void saveEventInWishlist(Workshop event) async {
  //   BookmarkProvider wishlistProvider = BookmarkProvider();
  //   await wishlistProvider.addToWishlist(event);
  // }
  //
  // void removeEventFromWishlist(Workshop event) async {
  //   BookmarkProvider wishlistProvider = BookmarkProvider();
  //   await wishlistProvider.removeFromWishlist(event);
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Workshop;

    return Scaffold(
      backgroundColor: appTheme.gray50,
      body: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Stack(
              children: [
                CustomImageView(
                  imagePath: args.image,
                  width: 374.h,
                  height: 230.h,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.v),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          backgroundColor: Colors.transparent,
                          height: 30.v,
                          leadingWidth: 43.h,
                          leading: AppbarLeadingImage(
                            onTap: () {
                              NavigatorService.goBack();
                            },
                            imagePath: ImageConstant.imgArrowDown,
                            margin: EdgeInsets.only(
                              left: 12.h,
                              top: 4.v,
                              bottom: 4.v,
                            ),
                          ),
                          // actions: [
                          //   CustomImageView(
                          //     onTap: () {
                          //       setState(() {
                          //         isBookmarkFilled = !isBookmarkFilled;
                          //       });
                          //
                          //       // Save the event when the bookmark is filled
                          //       if (isBookmarkFilled) {
                          //         saveEventInWishlist(args);
                          //       }
                          //     },
                          //     // Use the appropriate image path based on the state
                          //     imagePath: isBookmarkFilled
                          //         ? ImageConstant.newbook
                          //         : ImageConstant.newbookunfill,
                          //
                          //     height: 32.adaptSize,
                          //     width: 32.adaptSize,
                          //     margin: EdgeInsets.only(right: 10),
                          //   ),
                          // ],
                        ),
                        SizedBox(height: 34.v),
                        // CustomElevatedButton(
                        //   height: 29.v,
                        //   width: 88.h,
                        //   text: "lbl_conference".tr,
                        //   buttonTextStyle: TextStyle(color: Colors.white),
                        //   decoration: BoxDecoration(
                        //       color: Color(0xffF1F1F1),
                        //       borderRadius: BorderRadius.circular(3)),
                        //   margin: EdgeInsets.only(left: 21.h),
                        // ),
                        SizedBox(height: 1.v),
                        Container(
                          margin: EdgeInsets.only(left: 21.h, bottom: 10),
                          child: Text(
                            "${args.name}".tr,
                            style: TextStyle(
                              color: theme.colorScheme.onErrorContainer
                                  .withOpacity(1),
                              fontSize: 28.fSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.v),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.v),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(left: 21.h),
                    //   child: Row(
                    //     children: [
                    //       CustomIconButton(
                    //         height: 48.adaptSize,
                    //         width: 48.adaptSize,
                    //         padding: EdgeInsets.all(9.h),
                    //         decoration: BoxDecoration(
                    //             color: Color(0xffF1F1F1),
                    //             borderRadius: BorderRadius.circular(6)),
                    //         child: CustomImageView(
                    //           imagePath: ImageConstant.imgCalendar,
                    //         ),
                    //       ),
                    //       Opacity(
                    //         opacity: 0.84,
                    //         child: Padding(
                    //           padding: EdgeInsets.only(
                    //             left: 10.h,
                    //             top: 15.v,
                    //             bottom: 12.v,
                    //           ),
                    //           child: Text(
                    //             "${args.date}".tr,
                    //             style: TextStyle(
                    //               color: appTheme.black900.withOpacity(0.89),
                    //               fontSize: 16.fSize,
                    //               fontFamily: 'Inter',
                    //               fontWeight: FontWeight.w600,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 10.v),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     left: 21.h,
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       CustomIconButton(
                    //         height: 48.adaptSize,
                    //         width: 48.adaptSize,
                    //         padding: EdgeInsets.all(9.h),
                    //         decoration: BoxDecoration(
                    //             color: Color(0xffF1F1F1),
                    //             borderRadius: BorderRadius.circular(6)),
                    //         child: CustomImageView(
                    //           imagePath: ImageConstant.imgLinkedin,
                    //         ),
                    //       ),
                    //       Opacity(
                    //         opacity: 0.84,
                    //         child: Padding(
                    //           padding: EdgeInsets.only(
                    //             left: 10.h,
                    //             top: 15.v,
                    //             bottom: 12.v,
                    //           ),
                    //           child: Text(
                    //             "msg_aga_khan_university".tr,
                    //             style: TextStyle(
                    //               color: appTheme.black900.withOpacity(0.89),
                    //               fontSize: 16.fSize,
                    //               fontFamily: 'Inter',
                    //               fontWeight: FontWeight.w600,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 10.v),
                    // _buildFreeRow(context),
                    SizedBox(height: 10.v),
              Container(
                margin: EdgeInsets.only(left: 25.v,right: 25.v),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200], // Light grey color

                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Adab Fest\nProgram',
                      style: TextStyle(fontSize: 14.0,color: Colors.grey.shade900),
                    ),
                    SizedBox(width: 7,),
                    SizedBox(
                      height: 30,
                      child: ElevatedButton.icon(

                        onPressed: ()async {
                          String googleMapsUrl = '${args.pdfLink}';
                          if (await canLaunch(googleMapsUrl)) {
                          await launch(googleMapsUrl);
                          } else {
                          throw 'Could not launch $googleMapsUrl';
                          }
                        },

                        icon: SvgPicture.asset(
                          ImageConstant.download, // Path to your SVG file
                          width: 20.0,
                          height: 20.0,
                          color: Color(0xffE30512), // Icon color
                        ),
                        label: Text(
                          'Download PDF',
                          style: TextStyle(fontSize: 16.0,                           color: Color(0xffE30512), // Icon color
                          ), // Text color
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.all(4),
                          side: BorderSide(width: 1.0,                           color: Color(0xffE30512), // Icon color
                          ), // Green border
                        ),
                      ),
                    ),

                  ],
                ),
              ),
                    _buildPopularColumn(context, args),
                    SizedBox(height: 10.v),
                  //   Padding(
                  //     padding: EdgeInsets.only(left: 20.h),
                  //     child: Text(
                  //       "Organizers".tr,
                  //       style: CustomTextStyles.titleLargePrimary,
                  //     ),
                  //   ),
                  //   _buildFluentPORG(context, args),
                  //  args.speakers?.length ==  0 ? SizedBox() :Padding(
                  //     padding: EdgeInsets.only(left: 20.h),
                  //     child: Text(
                  //       "lbl_speakers".tr,
                  //       style: CustomTextStyles.titleLargePrimary,
                  //     ),
                  //   ),
                  //   SizedBox(height: 8.v),
                  // args.speakers?.length != 0 ?  _buildFluentMicFilled(context, args) : SizedBox(),
                  //   SizedBox(height: 10.v),
                  //   Padding(
                  //     padding: EdgeInsets.only(left: 21.h),
                  //     child: Text(
                  //       "lbl_gallery".tr,
                  //       style: CustomTextStyles.titleLargePrimary,
                  //     ),
                  //   ),
                  //   SizedBox(height: 10.v),
                  //   _buildEventDetailsSection(context, args),
                  //   SizedBox(height: 30.v),
                  //   CustomImageView(
                  //     onTap: () {
                  //       _launchGoogleMaps(args.pdfLink);
                  //     },
                  //     imagePath: ImageConstant.imgImage92,
                  //     height: 140.v,
                  //     width: 334.h,
                  //     radius: BorderRadius.circular(
                  //       10.h,
                  //     ),
                  //     alignment: Alignment.center,
                  //   ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "msg_don_t_have_an_account2".tr,
                                style:
                                CustomTextStyles.titleSmallMedium15),
                            TextSpan(
                                text: "lbl_sign_up".tr,
                                style: CustomTextStyles.titleSmallPrimary)
                          ]),
                          textAlign: TextAlign.left),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   child:  _buildRegisterNowStack(context, args)
      // ),
    );
  }

  void _launchGoogleMaps(url) async {
    String googleMapsUrl = '$url';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}

/// organizers
// Widget _buildFluentPORG(BuildContext context, Workshop args) {
//   return Container(
//     height: 100.v,
//     width: double.maxFinite,
//     child: Stack(
//       alignment: Alignment.centerLeft,
//       children: [
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Padding(
//               padding: EdgeInsets.only(
//                 left: 20.h,
//               ),
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: args.o!.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           height: 70.adaptSize,
//                           width: 70.adaptSize,
//                           child: CustomImageView(
//                             imagePath: '${args.organizers![index].image}',
//                             height: 80.adaptSize,
//                             width: 80.adaptSize,
//                             radius: BorderRadius.circular(
//                               40.h,
//                             ),
//                             alignment: Alignment.center,
//                           ),
//                         ),
//                         SizedBox(width: 10.v),
//                         Container(
//                           width: 180,
//                           child: Text(
//                             args.organizers![index].name!,
//                             maxLines: 2,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 14.fSize),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               )),
//         ),
//       ],
//     ),
//   );
// }

/// Section Widget
// Widget _buildFluentMicFilled(BuildContext context, Workshop args) {
//   return Container(
//     height: 120.v,
//     width: double.maxFinite,
//     decoration: AppDecoration.fillPrimary,
//     child: Stack(
//       alignment: Alignment.centerLeft,
//       children: [
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Padding(
//               padding: EdgeInsets.only(left: 20.h, top: 6.h),
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: args.!.length,
//                 itemBuilder: (context, index) {
//                   return Row(
//                     children: [
//                       _buildDrJamesSection(
//                         context,
//                         image: "${args.speakers![index].image}".tr,
//                         textStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14.fSize,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         doctorName: "${args.speakers![index].name}".tr,
//
//                         // Add any additional parameters needed for the _buildDrJamesSection function
//                       ),
//                     ],
//                   );
//                 },
//               )),
//         ),
//       ],
//     ),
//   );
// }

Widget _buildDrJamesSection(
  BuildContext context, {
  required String doctorName,
  String? image,
  TextStyle? textStyle,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        SizedBox(
          height: 70.adaptSize,
          width: 70.adaptSize,
          child: CustomImageView(
            imagePath: '$image',
            height: 80.adaptSize,
            width: 80.adaptSize,
            radius: BorderRadius.circular(
              40.h,
            ),
            alignment: Alignment.center,
          ),
        ),
        SizedBox(height: 7.v),
        Text(
          doctorName,
          style: textStyle,
        ),
      ],
    ),
  );
}

/// Section Widget

// Widget _buildEventDetailsSection(BuildContext context, Workshop args) {
//   return Consumer<EventDetailsProvider>(
//     builder: (context, provider, child) {
//       return StaggeredGridView.countBuilder(
//         shrinkWrap: true,
//         primary: false,
//         crossAxisCount: 4,
//         mainAxisSpacing: 4,
//         crossAxisSpacing: 4,
//         padding: EdgeInsets.only(left: 20),
//         staggeredTileBuilder: (index) {
//           return StaggeredTile.fit(
//               2); // Use StaggeredTile.fit(1) for a single-column layout
//         },
//         itemCount: args.image?.length ?? 0,
//         itemBuilder: (context, index) {
//           ImgList model = args.imgList![index];
//           return GestureDetector(
//             onTap: () {
//               _showImagePopup(context, args.imgList!, index);
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12.0),
//                 child: Image.network(
//                   '${model.image}',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }

void _showImagePopup(
    BuildContext context, List<ImgList> imgList, int initialIndex) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          ImagePopupScreen(imgList: imgList, initialIndex: initialIndex),
    ),
  );
}

class ImagePopupScreen extends StatelessWidget {
  final List<ImgList> imgList;
  final int initialIndex;

  const ImagePopupScreen({required this.imgList, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              PhotoViewGallery.builder(
                itemCount: imgList.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider:
                        NetworkImage(imgList[index].image.toString()),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(
                  color: Colors.black,
                ),
                pageController: PageController(initialPage: initialIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Section Widget
Widget _buildFreeRow(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 48.adaptSize,
            width: 48.adaptSize,
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: BorderRadius.circular(6)),
            child: CustomImageView(
              imagePath: ImageConstant.imgAmountIcon,
            ),
          ),
          Opacity(
            opacity: 0.84,
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.h,
                top: 15.v,
                bottom: 12.v,
              ),
              child: Text(
                "msg_registration_fee".tr,
                style: TextStyle(
                  color: appTheme.black900.withOpacity(0.90),
                  fontSize: 16.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Spacer(),
          CustomElevatedButton(
            height: 28.v,
            width: 58.h,
            text: "lbl_free".tr,
            margin: EdgeInsets.symmetric(vertical: 10.v),
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

/// Section Widget
Widget _buildPopularColumn(BuildContext context, Workshop args) {
  return Align(
    alignment: Alignment.center,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Program".tr,
            style: TextStyle(
              color: Color(0xffE30512),
              fontSize: 18.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.v),
          SizedBox(

            child:  Html(
              data: args.description != ''
                  ? '${args.description}'
                  : 'Not Available',
              style: {
                "div": styleshtml.Style(
                  fontFamily: 'Airbnb Cereal App',
                  fontWeight: FontWeight.w600,

                  fontSize: FontSize(14),

                ),
                "a": styleshtml.Style(textDecoration: TextDecoration.none),
              },
            ),


          ),
        ],
      ),
    ),
  );
}

/// Section Widget
Widget _buildRegisterNowStack(BuildContext context,Workshop args) {
  return SizedBox(
    height: 80.v,
    width: double.maxFinite,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomElevatedButton(
          height: 70.v,
          onPressed: () {
            if (args.finalDate != null) {
              // Split the date string into day, month, and year components
              List<String> dateComponents = args.finalDate!.split('-');

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
                    onTapRegistration(context, args);
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
          buttonTextStyle: TextStyle(
              color: Colors.white,
              fontFamily: "Inte",
              fontSize: 18,
              fontWeight: FontWeight.w600),
          width: double.maxFinite,
          text: "lbl_register_now".tr.toUpperCase(),
          margin: EdgeInsets.only(bottom: 16.v, left: 30.h, right: 20.h),
          rightIcon: Container(
            padding: EdgeInsets.fromLTRB(8.h, 8.v, 9.h, 9.v),
            margin: EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              color: theme.colorScheme.onErrorContainer.withOpacity(1),
              borderRadius: BorderRadius.circular(
                15.h,
              ),
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowleft,
              height: 13.adaptSize,
              width: 13.adaptSize,
            ),
          ),
          buttonStyle: CustomButtonStyles.outlinePrimary,
          alignment: Alignment.bottomCenter,
        ),
      ],
    ),
  );
}

/// section login
// Widget _buildLoginNowStack(BuildContext context, args) {
//   return SizedBox(
//     height: 80.v,
//     width: double.maxFinite,
//     child: Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         CustomElevatedButton(
//           height: 70.v,
//           onPressed: () {
//             onTapLogin(context, args);
//           },
//           buttonTextStyle: TextStyle(
//               color: Colors.white,
//               fontFamily: "Inte",
//               fontSize: 18,
//               fontWeight: FontWeight.w600),
//           width: double.maxFinite,
//           text: "Register Event".tr.toUpperCase(),
//           margin: EdgeInsets.only(bottom: 16.v, left: 30.h, right: 20.h),
//           rightIcon: Container(
//             padding: EdgeInsets.fromLTRB(8.h, 8.v, 9.h, 9.v),
//             decoration: BoxDecoration(
//               color: theme.colorScheme.onErrorContainer.withOpacity(1),
//               borderRadius: BorderRadius.circular(
//                 15.h,
//               ),
//             ),
//             child: CustomImageView(
//               imagePath: ImageConstant.imgArrowleft,
//               height: 13.adaptSize,
//               width: 13.adaptSize,
//             ),
//           ),
//           buttonStyle: CustomButtonStyles.outlinePrimary,
//           alignment: Alignment.bottomCenter,
//         ),
//       ],
//     ),
//   );
// }

onTapRegistration(BuildContext context, Workshop args)async {
    String googleMapsUrl = '${args.link.toString()}';
    try {
      // Uri requestedUri = Uri.dataFromString(url); //.dataFromString [wrong method]

      Uri requestedUri = Uri.parse(args.link.toString());// .parse is the correct method

      if (await canLaunchUrl(requestedUri)) {
        await launchUrl(requestedUri);
      } else {
        throw  Exception('Could not launch ${args.link.toString()}');
      }
    } on PlatformException catch (e) {
      debugPrint("PlatformException launchInBrowser : $e");
    } on Exception catch (e) {
      debugPrint( "Exception launchInBrowser : $e");
    }


}


onTapLogin(BuildContext context, Events args) {
  NavigatorService.pushNamed(
    AppRoutes.signUpScreen,
    arguments: args,
  );
}
