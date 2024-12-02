import '../../data/models/GlobalEvents/EventsModals.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../bookmark_screen/widgets/eventcardlist1_item_widget.dart';
import 'models/bookmark_model.dart';
import 'models/eventcardlist1_item_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'provider/bookmark_provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  BookmarkScreenState createState() => BookmarkScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BookmarkProvider(), child: BookmarkScreen());
  }
}

class BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.gray100,
        appBar: _buildAppBar(context),
        body: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
              SizedBox(height: 15.v),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text("lbl_bookmark_events".tr,
                          style: theme.textTheme.titleLarge))),
              SizedBox(height: 14.v),
              _buildEventCardList(context),
              SizedBox(height: 54.v)
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
      title: Text(
        "Bookmark Events",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.fSize,
          fontWeight: FontWeight.w500
        ),
      ),
      centerTitle: true,
    );
  }

  /// Section Widget
  Widget _buildEventCardList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.h),
        child: FutureBuilder<List<Events>>(
          future: Provider.of<BookmarkProvider>(context).getWishlist(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Return a loading indicator if data is still loading
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Handle error if there is any
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // Handle case where there is no wishlist data
              return Text('No wishlist data');
            } else {
              // Display the wishlist data using ListView.separated
              List<Events> wishlist = snapshot.data!;

              return ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.v);
                },
                itemCount: wishlist.length,
                itemBuilder: (context, index) {
                  Events event = wishlist[index];
                  return Eventcardlist1ItemWidget(
                    event,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
  /// Navigates to the homeScreenContainerScreen when the action is triggered.
  onTapImgHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }
}
