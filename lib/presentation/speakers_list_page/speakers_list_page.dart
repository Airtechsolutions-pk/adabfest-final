import 'package:adabfest/data/models/speakermodel/speaker_model.dart';
import 'package:adabfest/presentation/speaker_detail_screen/models/speaker_detail_model.dart';

import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_title.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'provider/speakers_list_provider.dart';

class SpeakersListPage extends StatefulWidget {
  const SpeakersListPage({Key? key}) : super(key: key);

  @override
  SpeakersListPageState createState() => SpeakersListPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SpeakersListProvider(), child: SpeakersListPage());
  }
}

class SpeakersListPageState extends State<SpeakersListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SpeakersListProvider>(context, listen: false).callbannerapi(
        onSuccess: () {},
        onError: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray50,
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10.v),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
              children: [
                SizedBox(height: 16.v),
                Consumer<SpeakersListProvider>(
                    builder: (context, provider, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    itemCount: (provider.getspeakerRepo?.isNotEmpty ?? false) ? provider.getspeakerRepo![0].speaker?.length ?? 0 : 0,
                    itemBuilder: (context, index) {
                      return _buildDoctorReviews(
                        context,
                        image:
                            provider.getspeakerRepo![0].speaker![index].image!,
                        doctorName:
                            provider.getspeakerRepo![0].speaker![index].name!,
                        description: provider
                            .getspeakerRepo![0].speaker![index].designation!,
                        onTapDoctorReviews: () {
                          onTapDoctorReviews(context,provider.getspeakerRepo[0].speaker![index]);
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
          onTapDoctorReviews!.call();
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
                            width: 159.h,
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
              CustomImageView(
                  imagePath: ImageConstant.imgArrowRight,
                  height: 18.adaptSize,
                  width: 18.adaptSize,
                  margin: EdgeInsets.only(top: 31.v, right: 2.h, bottom: 31.v))
            ])));
  }

  /// Navigates to the speakerDetailOneScreen when the action is triggered.
  onTapDoctorReviews(BuildContext context,Speaker args) {
    NavigatorService.pushNamed(
      AppRoutes.speakerDetailScreen,
      arguments: args
    );
  }
}
