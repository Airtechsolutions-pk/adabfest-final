import 'dart:io';

import 'package:adabfest/data/models/GlobalEvents/EventsModals.dart';
import 'package:adabfest/data/models/speakermodel/speaker_model.dart';
import 'package:adabfest/data/models/workshopModel/workShopmodel.dart';
import 'package:adabfest/presentation/events_all_page/events_all_page.dart';
import 'package:adabfest/presentation/home_screen/models/Banner.dart';
import 'package:adabfest/presentation/home_screen/widgets/popup.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/custom_icon_button.dart';
import '../home_screen/widgets/eventcard_item_widget.dart';
import '../home_screen/widgets/eventcardlist_item_widget.dart';
import '../home_screen/widgets/rectangle_item_widget.dart';
import '../home_screen/widgets/viewhierarchylist_item_widget.dart';

import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/past_events_tab_container_page/past_events_tab_container_page.dart';
import 'package:adabfest/presentation/speakers_list_page/speakers_list_page.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_title.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:adabfest/widgets/custom_bottom_bar.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeProvider(), child: HomeScreen());
  }
}

// ignore_for_file: must_be_immutable
class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<HomeProvider>(context, listen: false).calltoken();
      });
      Provider.of<HomeProvider>(context, listen: false).callbannerapi(
        onSuccess: () {},
        onError: () {},
      );
      Provider.of<HomeProvider>(context, listen: false).callworkshop(
        onSuccess: () {},
        onError: () {},
      );
      Provider.of<HomeProvider>(context, listen: false).callevents(
        onSuccess: () {},
        onError: () {},
      );
      Provider.of<HomeProvider>(context, listen: false).callspeakerApi(
        onSuccess: () {},
      );
      Provider.of<HomeProvider>(context, listen: false).callmessage(
        onSuccess: () {},
        onError: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildViewHierarchyList(context),
        _buildWorkshop(context),
        Opacity(
            opacity: 0.99,
            child: Padding(
                padding: EdgeInsets.only(top: 20.v, left: 20),
                child: Text("Founder".tr,
                    style: TextStyle(
                        color: appTheme.redA223,
                        fontSize: 20.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600)))),

        // _buildSeeAllRow(context),
        _buildRectangleColumn(context),
        _buildname(context),
        SizedBox(
          height: 15,
        ),
        _buildCategoryList(context),
        SizedBox(
          height: 15,
        ),
        _buildEventCardList(context),
      ]),
    );
  }

  /// section name
  Widget _buildname(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Padding(
          padding: EdgeInsets.fromLTRB(10.h, 25.v, 0.h, 8.v),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0.99,
                child: Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Text(
                    "Adab Fest Agenda’s".tr,
                    style: TextStyle(
                      color: appTheme.redA223,
                      fontSize: 20.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              FutureBuilder<String?>(
                future: homeProvider.getPdfUrl(), // Wait for the PDF URL
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Show a loading indicator while waiting
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}'); // Show error message if something went wrong
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Text('No PDF available'); // Handle case where no PDF URL is returned
                  } else {
                    String? pdfUrl = snapshot.data; // Get the actual PDF URL

                    return Container(
                      height: 35,
                      margin: EdgeInsets.only(right: 10),
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          if (await canLaunch(pdfUrl!)) {
                            await launch(pdfUrl);
                          } else {
                            throw 'Could not launch $pdfUrl';
                          }
                        },
                        icon: SvgPicture.asset(
                          ImageConstant.download, // Path to your SVG file
                          width: 18.0,
                          height: 18.0,
                          color: Color(0xffE30512), // Icon color
                        ),
                        label: Text(
                          'Download PDF',
                          style: TextStyle(
                            fontSize: 14.5,
                            color: Colors.black, // Text color
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.all(4),
                          side: BorderSide(
                            width: 1.0,
                            color: Color(0xff990000), // Border color
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildWorkshop(BuildContext context) {
    return Align(
      child: Container(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 18.h, top: 5.v,bottom: 5.v),
                child: Row(children: [
                  Opacity(
                      opacity: 0.99,
                      child: Text("Programmes".tr,
                          style: TextStyle(
                              color: appTheme.redA223,
                              fontSize: 20.fSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600))),
                  // CustomElevatedButton(
                  //     width: 70.h,
                  //     text: "lbl_see_all".tr,
                  //     buttonStyle: ElevatedButton.styleFrom(
                  //         primary: Color(0xffECECF1)),
                  //     buttonTextStyle:
                  //         TextStyle(color: Color(0xffE30512)),
                  //     margin: EdgeInsets.only(left: 110.h))
                ])),
            Consumer<HomeProvider>(
              builder: (context, provider, child) {
                return Container(
                  height: 175.h,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    //itemCount: provider.workshoprepo[0].workshop?.length ?? 0,
                    itemCount: (provider.workshoprepo?.isNotEmpty ??
                        false)
                        ? provider.workshoprepo![0].workshop?.length ?? 0
                        : 0,
                    itemBuilder: (context, eventIndex) {
                      Workshop model =
                          provider.workshoprepo[0].workshop![eventIndex];
                      print("------>>> ${provider.workshoprepo.length}");
                      return EventcardItemWidget(model);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRectangleColumn(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        // Remove fixed height for the Container or set it to a flexible value.
        // height: 100.v,
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 10.v),
        decoration: BoxDecoration(
          image: new DecorationImage(
            image:   AssetImage(
                 ImageConstant.founderbk,

                ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(alignment: Alignment.center, children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // Remove fixed height for the SizedBox or set it to a flexible value.
                    // height: 80.v,
                    child: Consumer<HomeProvider>(
                      builder: (context, provider, child) {
                        return Container(
                          // Remove fixed height for the Container or set it to a flexible value.
                          height: 125.v,
                          margin: EdgeInsets.only(top: 15),
                          alignment: Alignment.centerLeft,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: (provider.messageApi?.isNotEmpty ??
                                    false)
                                ? provider.messageApi![0].message?.length ?? 0
                                : 0,
                            itemBuilder: (context, index) {
                              var model =
                                  provider.messageApi![0].message![index];
                              return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return MessagePopup(model: model);
                                      },
                                    );
                                  },
                                  child: RectangleItemWidget(
                                    model,
                                  ));
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 5.v,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8.v),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  onTapDoctorReviews(BuildContext context, Speaker args) {
    NavigatorService.pushNamed(AppRoutes.speakerDetailScreen, arguments: args);
  }

  /// Section Widge
  Widget _buildViewHierarchyList(BuildContext context) {
    return SizedBox(
      height: 120.v,
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          List<Banners>? banners = provider.getbannerRepo.isNotEmpty
              ? provider.getbannerRepo[0].banners
              : null;

          double viewportFraction = MediaQuery.of(context).size.width >= 600
              ? 0.9 // Set viewportFraction to 0.9 for larger screens
              : 1.0; // Set viewportFraction to 1.0 for smaller screens

          return CarouselSlider.builder(
            itemCount: banners?.length ?? 0,
            options: CarouselOptions(
              height: 120.v,
              enableInfiniteScroll: true,
              autoPlay: true, // Set to true for auto-sliding
              autoPlayInterval:
              Duration(seconds: 2), // Set the auto-slide interval
              viewportFraction: viewportFraction,
              enlargeCenterPage: false,
            ),
            itemBuilder: (context, index, realIndex) {
              Banners banner = banners != null && banners.length > index
                  ? banners[index]
                  : Banners(); // Adjust Banners() based on your class constructor
              return Padding(
                padding: EdgeInsets.only(
                  top: 5.v,
                ),
                child: ViewhierarchylistItemWidget(
                  banner,
                  onTapImgStackImage: () {
                    // onTapImgStackImage(context);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  int selectedCategoryIndex = 0; // Track the index of the selected category

  Widget _buildCategoryList(BuildContext context) {
    return Container(
        height: 150.0, // Adjust the height as needed
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 11, right: 25),
            itemCount: Provider.of<HomeProvider>(context).getevents.isNotEmpty
                ? Provider.of<HomeProvider>(context)
                    .getevents[0]
                    .eventcategories!
                    .length
                : 0,
            itemBuilder: (context, index) {
              Eventcategories category = Provider.of<HomeProvider>(context)
                  .getevents[0]
                  .eventcategories![index];

              BoxDecoration decoration = BoxDecoration(
                border: index == selectedCategoryIndex
                    ? Border.all(color: Colors.red.shade800, width: 1.0)
                    : Border.all(color: Colors.grey.shade400, width: 1.0),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              );

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  child: Container(
                    width: 160, // Adjust the width as needed

                    decoration: decoration,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Image with 80x80 size
                        Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              category.image!, // Provide the URL or image path here
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                3), // Adjust the spacing between image and text
                        // Text below the image
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            category.name!,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: index == selectedCategoryIndex
                                  ? Colors.red.shade900
                                  : Colors.grey.shade600,
                              fontSize: 14.0,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Widget _buildEventCardList(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        if (provider.getevents.isNotEmpty) {
          Eventcategories category =
              provider.getevents[0].eventcategories![selectedCategoryIndex];

          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: category.events?.length ?? 0,
            itemBuilder: (context, eventIndex) {
              Events model = category.events![eventIndex];
              if (model.isFeatured == false) {
                return EventcardlistItemWidget(model);
              } else {
                return Container();
              }
            },
          );
        } else  {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ///Handling page based on route

  onTapImgspeakers(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.speakersListPage,
    );
  }
}
