import 'package:adabfest/data/models/myevents/myevents.dart';

import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../my_tickets_screen/widgets/eventcard3_item_widget.dart';
import 'models/eventcard3_item_model.dart';
import 'models/my_tickets_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'provider/my_tickets_provider.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({Key? key}) : super(key: key);

  @override
  MyTicketsScreenState createState() => MyTicketsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyTicketsProvider(), child: MyTicketsScreen());
  }
}

class MyTicketsScreenState extends State<MyTicketsScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int? userId =
      await Provider.of<MyTicketsProvider>(context, listen: false).getUserId();


      Provider.of<MyTicketsProvider>(context, listen: false)
          .calluserapi(onSuccess: () {


      }, onError: () {},userid: userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
        backgroundColor: appTheme.gray100,
        body: SingleChildScrollView(
          child: SizedBox(
              width: double.maxFinite,
              child: Column(children: [
                SizedBox(height: 16.v),
                _buildViewTicketButtonColumn(context),
                SizedBox(height: 5.v)
              ])),
        ));
  }

  /// Section Widget

  /// Section Widget
  Widget _buildViewTicketButtonColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 19.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Text("My QR".tr,
                  style: theme.textTheme.titleLarge)),
          SizedBox(height: 13.v),
          Consumer<MyTicketsProvider>(
              builder: (context, provider, child) {
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.v);
                  },
                  itemCount: provider.getqr.isNotEmpty ? provider.getqr.length : 0, // Ensure list is not empty
                  itemBuilder: (context, index) {
                    // Safely access the event object
                    MyEvent event = provider.getqr[index];

                    print("my event is ${event.event?.contactNo ?? "sdfsd"}");

                    // Check if event is null before passing it to the widget
                    if (event != null) {
                      return Eventcard3ItemWidgetaAccept(event.event); // Pass event directly
                    } else {
                      return SizedBox(); // Return an empty widget or alternative when event is null
                    }
                  },
                );
              }
          )


        ]));
  }


  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 58.h,
      backgroundColor: Color(0xffE30512),
      centerTitle: true,
      title: Text("My QR",style: TextStyle(
          color: Colors.white,
          fontSize: 20.fSize,
          fontWeight: FontWeight.w500
      ),),
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
    );
  }

  /// Navigates to the homeScreenContainerScreen when the action is triggered.
  onTapImgHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }
}
