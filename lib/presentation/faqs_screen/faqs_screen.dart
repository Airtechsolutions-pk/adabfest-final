import '../../data/models/setting/settingModel.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'models/faqs_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'provider/faqs_provider.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  FaqsScreenState createState() => FaqsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FaqsProvider(), child: FaqsScreen());
  }
}

class FaqsScreenState extends State<FaqsScreen> {
  final FaqsProvider faqsProvider = FaqsProvider(); // Instantiate FaqsProvider

  @override
  void initState() {
    super.initState();
    faqsProvider.callspeakerApi(
      onSuccess: () {
        // Do something on success if needed
      },
      onError: () {
        // Handle error if needed
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: FutureBuilder<List<SettingModel>>(
      //     future: faqsProvider.callspeakerApi(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(child: CircularProgressIndicator());
      //       } else if (snapshot.hasError) {
      //         return Text('Error: ${snapshot.error}');
      //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //         return Text('No FAQs available');
      //       } else {
      //         List<SettingModel> faqsList = snapshot.data!;
      //         return SingleChildScrollView(
      //           child: Column(
      //             children: (faqsList.expand((faq) {
      //               return faq.setting?.faqs?.map<Widget>((faqItem) {
      //                 return Container(
      //
      //                   margin: EdgeInsets.all(10),
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(6.0),
      //                     boxShadow: [
      //                       BoxShadow(
      //                         color: Colors.black.withOpacity(0.1),
      //                         blurRadius: 4.0,
      //                         spreadRadius: 1.0,
      //                         offset: Offset(0, 2),
      //                       ),
      //                     ],
      //                   ),
      //                   child: ExpansionTile(
      //                     backgroundColor: Colors.white,
      //                     expandedAlignment: Alignment.center,
      //                     collapsedIconColor: Colors.black,
      //                     collapsedBackgroundColor: Colors.white,
      //
      //                     title: ListTile(
      //                       title: Text(
      //                         faqItem.faqQ ?? 'No Question',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w600,
      //                           fontFamily: "Inter",
      //                           fontSize: 13.0,
      //                         ),
      //                       ),
      //                     ),
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.symmetric(horizontal: 12.0),
      //                         child: Divider(
      //                           thickness: 1,
      //                           color: Colors.grey,
      //                         ),
      //                       ),
      //                       ListTile(
      //
      //                         title: Text(
      //                           faqItem.faqA ?? 'No Answer',
      //                           style: TextStyle(
      //                             fontWeight: FontWeight.w500,
      //                             fontFamily: "Inter",
      //                             fontSize: 13.0,
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 );
      //               }) ?? <Widget>[];
      //             }).toList()),
      //           ),
      //         );
      //       }
      //     },
      //   ),
      // ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 58.h,
      backgroundColor: Color(0xffE30512),
      leading: AppbarLeadingImage(
        onTap: () {
          NavigatorService.goBack();
        },
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(top: 2.v, right: 19.h, left: 12),
      ),
      title: Text(
        "FAQ's",
        style: TextStyle(
            color: Colors.white,
            fontSize: 20.fSize,
            fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      styleType: Style.bgFill,
    );
  }

  /// Section Widget

  /// Navigates to the homeScreen when the action is triggered.
  onTapImgHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }
}
