import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../our_partners_screen/widgets/ourpartnersgrid_item_widget.dart';
import 'models/ourpartnersgrid_item_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'provider/our_partners_provider.dart';

class OurPartnersScreen extends StatefulWidget {
  const OurPartnersScreen({Key? key}) : super(key: key);

  @override
  OurPartnersScreenState createState() => OurPartnersScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => OurPartnersProvider(), child: OurPartnersScreen());
  }
}

class OurPartnersScreenState extends State<OurPartnersScreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OurPartnersProvider>(context, listen: false)
          .callbannerapi(
        onSuccess: () {

        },
        onError: () {

        },
      );


    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: _buildAppBar(context),
        backgroundColor: appTheme.gray100,
        body: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
              SizedBox(height: 15.v),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text("lbl_our_partners".tr,
                          style: theme.textTheme.titleLarge))),
              SizedBox(height: 10.v),
              _buildOurPartnersGrid(context),
              SizedBox(height: 67.v)
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
        "Organising Committee",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20.fSize
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildOurPartnersGrid(BuildContext context) {
    return Expanded(
      child: Consumer<OurPartnersProvider>(
        builder: (context, provider, child) {
          List<Partner>? partners = provider.getbannerRepo?.isNotEmpty ?? false
              ? provider.getbannerRepo![0].partner
              : [];

          return GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: partners?.length ?? 0,
            padding: EdgeInsets.only(left: 10,right: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Maximum of 3 items in one row
              mainAxisSpacing: 12.h, // Space between rows
              crossAxisSpacing: 12.h, // Space between items in a row
              childAspectRatio: 3 / 2, // Adjust ratio for wider images
            ),
            itemBuilder: (context, index) {
              bool isSingleItemRow = ((index + 1) % 4 == 0); // Every 4th item is centered
              return isSingleItemRow
                  ? _buildSingleCenteredItem(partners![index])
                  : _buildGridItem(partners![index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildGridItem(Partner partner) {
    return OurpartnersgridItemWidget(partner);
  }

  Widget _buildSingleCenteredItem(Partner partner) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.h), // Center single item with padding
      child: OurpartnersgridItemWidget(partner),
    );
  }
  /// Navigates to the homeScreenContainerScreen when the action is triggered.
  onTapImgHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }
}
