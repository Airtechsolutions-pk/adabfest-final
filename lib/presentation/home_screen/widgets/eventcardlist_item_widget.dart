import 'package:adabfest/data/models/GlobalEvents/EventsModals.dart';

import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../bookmark_screen/provider/bookmark_provider.dart';
import '../../login_screen/provider/login_provider.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventcardlistItemWidget extends StatefulWidget {
  EventcardlistItemWidget(
      this.eventcardlistItemModelObj, {
        Key? key,
        this.onTapImgStackImage,
      }) : super(
    key: key,
  );

  final Events eventcardlistItemModelObj;
  final VoidCallback? onTapImgStackImage;

  @override
  State<EventcardlistItemWidget> createState() => _EventcardlistItemWidgetState();
}

class _EventcardlistItemWidgetState extends State<EventcardlistItemWidget> {
  late SharedPreferences _prefs;
  late String _bookmarkKey;
  bool isBookmarkFilled = false;

  @override
  void initState() {
    super.initState();
    //checkLoggedInStatus();

    _bookmarkKey = 'bookmark_${widget.eventcardlistItemModelObj.eventID}';
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      isBookmarkFilled = _prefs.getBool(_bookmarkKey) ?? false;
    });
  }

  Future<void> _toggleBookmark(bool newBookmarkState) async {
    setState(() {
      isBookmarkFilled = newBookmarkState;
    });
    await _prefs.setBool(_bookmarkKey, newBookmarkState);
    if (newBookmarkState) {
      saveEventInWishlist(widget.eventcardlistItemModelObj);
    } else {
      removeEventFromWishlist(widget.eventcardlistItemModelObj);
    }
  }

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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.v),
      margin: EdgeInsets.only(top: 5, bottom: 5,left: 20,right: 20),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            margin: EdgeInsets.only(left: 20.v),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Align elements to the end (bottom) of the row
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Title',
                    style: TextStyle(
                      color: Color(0xff990000),
                      fontSize: 12.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.only(left: 1.v, bottom: 3.v),
                    child: Text(
                      '${widget.eventcardlistItemModelObj.name ?? ''}',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3,),
          widget.eventcardlistItemModelObj.speakers!.isNotEmpty ?   Container(
            margin: EdgeInsets.only(left: 20.v),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end, // Align elements to the end (bottom) of the row
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Speaker',
                    style: TextStyle(
                      color: Color(0xff990000),
                      fontSize: 12.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 1.v, bottom: 3.v),
                        child: Text(
                          '${widget.eventcardlistItemModelObj.speakers != null && widget.eventcardlistItemModelObj.speakers!.isNotEmpty ? widget.eventcardlistItemModelObj.speakers![0].name ?? '' : ''}',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12.fSize,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      CustomImageView(
                        imagePath: widget.eventcardlistItemModelObj.speakers != null && widget.eventcardlistItemModelObj.speakers!.isNotEmpty
                            ? widget.eventcardlistItemModelObj.speakers![0].image
                            : "", // Provide a default value for imagePath if the list is empty or null
                        height: 35.adaptSize,
                        width: 35.adaptSize,
                        fit: BoxFit.cover,
                        radius: BorderRadius.circular(20.adaptSize),
                        margin: EdgeInsets.only(bottom: 1.v, left: 15.v), // Adjust margin as needed
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ) : SizedBox(),
          SizedBox(height: 3,),

          Container(
            margin: EdgeInsets.only(left: 20.v),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end, // Align elements to the end (bottom) of the row
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Date & Time',
                    style: TextStyle(
                      color: Color(0xff990000),
                      fontSize: 12.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.only(left: 1.v, bottom: 3.v),
                    child: Text(
                      '${widget.eventcardlistItemModelObj.eventDate ?? ''} | ${widget.eventcardlistItemModelObj.eventTime ?? ''} - ${widget.eventcardlistItemModelObj.eventEndTime ?? ''}',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3,),

          Container(
            margin: EdgeInsets.only(left: 20.v),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end, // Align elements to the end (bottom) of the row
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Venue',
                    style: TextStyle(
                      color: Color(0xff990000),
                      fontSize: 12.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.only(left: 1.v, bottom: 3.v),
                    child: Text(
                      '${widget.eventcardlistItemModelObj.location ?? ''}',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3,),


        ],
      ),
    );
  }

  onTapImgRegis(BuildContext context, args) {
    print("---> ${isLoggedIn}");
    // isLoggedIn
    //     ?
    NavigatorService.pushNamed(
      AppRoutes.registrationScreen,
      arguments: args,);
    //     : NavigatorService.pushNamed(
    //   AppRoutes.loginScreen,
    //   arguments: args,
    // );
  }

  bool isLoggedIn = false;



  Future<void> checkLoggedInStatus() async {
    bool loggedIn = await LoginProvider().isLoggedIn();
    setState(() {
      isLoggedIn = loggedIn;
    });
  }
}
