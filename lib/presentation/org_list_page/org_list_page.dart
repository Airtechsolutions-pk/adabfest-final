import 'package:adabfest/data/models/speakermodel/speaker_model.dart';
import 'package:adabfest/presentation/speaker_detail_screen/models/speaker_detail_model.dart';

import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_title.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'provider/org_list_provider.dart';

class OrgListPage extends StatefulWidget {
  const OrgListPage({Key? key}) : super(key: key);

  @override
  OrgListPageState createState() => OrgListPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => OrgListPageListProvider(), child: OrgListPage());
  }
}

class OrgListPageState extends State<OrgListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrgListPageListProvider>(context, listen: false).callbannerapi(
        onSuccess: () {},
        onError: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray50,
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10.v),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
              children: [
                SizedBox(height: 16.v),
                Consumer<OrgListPageListProvider>(
                    builder: (context, provider, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    itemCount: (provider.getspeakerRepo?.isNotEmpty ?? false) ? provider.getspeakerRepo![0].organisingCommittee?.length ?? 0 : 0,
                    itemBuilder: (context, index) {
                      return _buildDoctorReviews(
                        context,
                        image:
                            provider.getspeakerRepo![0].organisingCommittee![index].image!,
                        doctorName:
                            provider.getspeakerRepo![0].organisingCommittee![index].name!,
                        description: provider
                            .getspeakerRepo![0].organisingCommittee![index].designation!,
                        onTapDoctorReviews: () {
                        },
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 58.h,
      backgroundColor: Color(0xffE30512),
      centerTitle: true,
      title: Text("Organising Committee",style: TextStyle(
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

  /// Common widget
  Widget _buildDoctorReviews(
    BuildContext context, {
    required String image,
    required String doctorName,
    required String description,
    Function? onTapDoctorReviews,
  }) {
    return GestureDetector(
        onTap: () {
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
            margin: EdgeInsets.only(top: 5,bottom: 5),
            decoration: AppDecoration.outlineGray70011
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.adaptSize),

                child: CustomImageView(
                    imagePath: image,
                    height: 70.adaptSize,
                    width: 70.adaptSize,
                    radius: BorderRadius.circular(10.h)),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 18.h, top: 13.v, bottom: 10.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doctorName,
                            style: TextStyle(
                                color: appTheme.black900,
                                fontSize: 15.fSize,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 4.v),
                        SizedBox(
                            width: 199.h,
                            child: Text(description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: appTheme.gray700,
                                    fontSize: 12.fSize,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400)))
                      ])),
              Spacer(),

            ])));
  }

  /// Navigates to the speakerDetailOneScreen when the action is triggered.


}
