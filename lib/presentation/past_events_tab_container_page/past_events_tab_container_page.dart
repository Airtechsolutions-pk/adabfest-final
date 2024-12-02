import 'package:adabfest/presentation/filter_bottomsheet/provider/filter_provider.dart';
import 'package:adabfest/presentation/past_events_empty_page/provider/past_events_empty_provider.dart';

import '../../data/models/GlobalEvents/EventsModals.dart';
import '../events_all_page/provider/events_all_provider.dart';
import '../events_all_page/widgets/eventcard3_item_widget.dart';
import '../filter_bottomsheet/filter_bottomsheet.dart';
import '../home_screen/widgets/eventcardlist_item_widget.dart';
import '../past_events_empty_page/widget/itemcardwidget.dart';
import 'models/past_events_tab_container_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/presentation/events_all_page/events_all_page.dart';
import 'package:adabfest/presentation/past_events_empty_page/past_events_empty_page.dart';
import 'package:adabfest/widgets/app_bar/appbar_leading_image.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:adabfest/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:adabfest/widgets/app_bar/custom_app_bar.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'provider/past_events_tab_container_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PastEventsTabContainerPage extends StatefulWidget {
  const PastEventsTabContainerPage({Key? key}) : super(key: key);

  @override
  PastEventsTabContainerPageState createState() => PastEventsTabContainerPageState();

  static Widget builder(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PastEventsTabContainerProvider()),
        ChangeNotifierProvider(create: (context) => EventsAllProvider()),
        ChangeNotifierProvider(create: (context) => PastEventsEmptyProvider()),
      ],
      child: PastEventsTabContainerPage(),
    );
  }
}

class PastEventsTabContainerPageState extends State<PastEventsTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PastEventsTabContainerProvider>(context, listen: false).callevents(
        onSuccess: () {},
        onError: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        body: Consumer<PastEventsTabContainerProvider>(
          builder: (context, provider, child) {
            return SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 19.v),
                  //_buildFiltersTab(context, provider),
                  SizedBox(height: 15.v),
                  _buildTabview(context),
                  Expanded(
                    child: SizedBox(
                      height: 535.v,
                      child: TabBarView(
                        controller: tabviewController,
                        children: [
                          // Upcoming Events Tab
                          Consumer<PastEventsTabContainerProvider>(
                            builder: (context, provider, child) {
                              return provider.upcomingEvents.isNotEmpty
                                  ? ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 10.v);
                                },
                                itemCount: provider.upcomingEvents.length,
                                itemBuilder: (context, categoryIndex) {
                                  final events = provider.upcomingEvents[categoryIndex];
                                  return EventcardlistItemWidget(events);
                                },
                              )
                                  :  Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/noevent.png',
                                      height: 250,
                                      width: 250,
                                    ),

                                  ],
                                ),
                              );
                            },
                          ),

                          // Past Events Tab
                          Consumer<PastEventsTabContainerProvider>(
                            builder: (context, provider, child) {
                              return provider.pastEvents.isNotEmpty
                                  ? ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 10.v);
                                },
                                itemCount: provider.pastEvents.length,
                                itemBuilder: (context, categoryIndex) {
                                  final events = provider.pastEvents[categoryIndex];
                                  return EventcardlistItemWidget(events);
                                },
                              )
                                  : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/noevent.png',
                                      height: 250,
                                      width: 250,
                                    ),

                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Tab view section widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 45.v,
      width: 337.h,
      decoration: BoxDecoration(
        color: appTheme.blueGray50,
        borderRadius: BorderRadius.circular(10.h),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.onErrorContainer.withOpacity(1),
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: theme.colorScheme.secondaryContainer,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        indicatorPadding: EdgeInsets.all(6.0.h),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(6.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.black900.withOpacity(0.05),
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(0, 3),
            ),
          ],
        ),
        tabs: [
          Tab(child: Text("lbl_upcoming".tr)),
          Tab(child: Text("lbl_past_events".tr)),
        ],
      ),
    );
  }
}

// ignore_for_file: must_be_immutable
// class PastEventsTabContainerPage extends StatefulWidget {
//   const PastEventsTabContainerPage({Key? key})
//       : super(
//           key: key,
//         );
//
//   @override
//   PastEventsTabContainerPageState createState() =>
//       PastEventsTabContainerPageState();
//   static Widget builder(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//             create: (context) => PastEventsTabContainerProvider()),
//         ChangeNotifierProvider(
//             create: (context) => EventsAllProvider()), // Add this line
//
//         ChangeNotifierProvider(
//             create: (context) => PastEventsEmptyProvider()), // Add this line
//       ],
//       child: PastEventsTabContainerPage(),
//     );
//   }
// }
//
// class PastEventsTabContainerPageState extends State<PastEventsTabContainerPage>
//     with TickerProviderStateMixin {
//   late TabController tabviewController;
//
//   @override
//   void initState() {
//     super.initState();
//     tabviewController = TabController(length: 2, vsync: this);
//
//     // Move the provider.callevents call to a post-frame callback
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//
//       Provider.of<PastEventsTabContainerProvider>(context, listen: false)
//           .callevents(
//         onSuccess: () {
//
//         },
//         onError: () {},
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             backgroundColor: appTheme.gray50,
//             body: Consumer<PastEventsTabContainerProvider>(
//                 builder: (context, provider, child) {
//               return SizedBox(
//                 width: double.maxFinite,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 19.v),
//                     //_buildFiltersTab(context,provider),
//                     SizedBox(height: 15.v),
//                     _buildTabview(context),
//                     Expanded(
//                       child: SizedBox(
//                           height: 535.v,
//                           child: TabBarView(
//                             controller: tabviewController,
//                             children: [
//                               Consumer<PastEventsTabContainerProvider>(
//                                 builder: (context, provider, child) {
//                                   return provider.isfilter! ? ListView.separated(
//                                     shrinkWrap: true,
//                                     separatorBuilder: (context, index) {
//                                       return SizedBox(height: 10.v);
//                                     },
//                                     itemCount:
//                                     provider.upcomingEvents.length ?? 0,
//                                     itemBuilder: (context, categoryIndex) {
//                                       Events events = provider
//                                           .upcomingEvents![categoryIndex];
//
//                                       return EventcardlistItemWidget(events);
//                                     },
//                                   ) :ListView.separated(
//                                     shrinkWrap: true,
//                                     separatorBuilder: (context, index) {
//                                       return SizedBox(height: 10.v);
//                                     },
//                                     itemCount:
//                                         provider.upcomingEvents.length ?? 0,
//                                     itemBuilder: (context, categoryIndex) {
//                                       Eventcategories events = provider
//                                           .upcomingEvents![categoryIndex];
//
//                                       return ListView.builder(
//                                         shrinkWrap: true,
//                                         physics: NeverScrollableScrollPhysics(),
//                                         itemCount: events.events!.length,
//                                         itemBuilder: (context, eventIndex) {
//                                           Events event = events.events![eventIndex];
//                                           return EventcardlistItemWidget(event);
//                                         },
//                                       );
//                                     },
//                                   );
//                                 },
//                               ),
//                               Consumer<PastEventsTabContainerProvider>(
//                                 builder: (context, provider, child) {
//                                   return  provider.isfilter! ? ListView.separated(
//                                     shrinkWrap: true,
//                                     separatorBuilder: (context, index) {
//                                       return SizedBox(height: 10.v);
//                                     },
//                                     itemCount:
//                                     provider.pastEvents.length ?? 0,
//                                     itemBuilder: (context, categoryIndex) {
//                                       Events events = provider
//                                           .pastEvents![categoryIndex];
//
//                                       return EventcardlistItemWidget(events);
//                                     },
//                                   ) :ListView.separated(
//                                     shrinkWrap: true,
//                                     separatorBuilder: (context, index) {
//                                       return SizedBox(height: 10.v);
//                                     },
//                                     itemCount:
//                                     provider.pastEvents.length ?? 0,
//                                     itemBuilder: (context, categoryIndex) {
//                                       Eventcategories events = provider
//                                           .pastEvents![categoryIndex];
//
//                                       return ListView.builder(
//                                         shrinkWrap: true,
//                                         physics: NeverScrollableScrollPhysics(),
//                                         itemCount: events.events!.length,
//                                         itemBuilder: (context, eventIndex) {
//                                           Events event = events.events![eventIndex];
//                                           return EventcardlistItemWidget(event);
//                                         },
//                                       );
//                                     },
//                                   );
//                                 },
//                               ),
//                             ],
//                           )),
//                     ),
//                   ],
//                 ),
//               );
//             })));
//   }
//
//
//
//
//
//   /// Section Widget
//   Widget _buildFiltersTab(BuildContext context, PastEventsTabContainerProvider provider) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 19.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Opacity(
//             opacity: 0.84,
//             child: Text(
//               "lbl_events".tr,
//               style: TextStyle(
//                 color: appTheme.black900,
//                 fontSize: 20.fSize,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           CustomElevatedButton(
//             width: 76.h,
//             text: "lbl_filters".tr,
//             onPressed: () async {
//               // onTapFilters(context);
//             await  showModalBottomSheet(
//                 context: context,
//                 builder: (_) => StatefulBuilder(
//                   builder: (BuildContext context, StateSetter setState) {
//                     return SingleChildScrollView(
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                           top: 10.0,
//                           bottom: 207.0,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               width: double.maxFinite,
//                               child: Divider(
//                                 color: Colors.grey,
//                                 indent: 141.0,
//                                 endIndent: 140.0,
//                               ),
//                             ),
//                             SizedBox(height: 10.0),
//                             Column(
//                               children: provider.allCategories!.map((category) {
//                                 return CheckboxListTile(
//                                   title: Text(category!.name!),
//                                   value: provider.selectedCategories.contains(category),
//                                   onChanged: (value) {
//                                     setState(() {
//                                       if(value == true){
//                                         provider.selectedCategories.add(category);
//
//                                       }else{
//                                         provider.selectedCategories.remove(category);
//                                       }
//                                     });
//                                   },
//                                 );
//                               }).toList(),
//                             ),
//
//
//
//                             Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: CustomElevatedButton(
//                               height: 58.v,
//
//
//
//                               text: "Apply".tr.toUpperCase(),
//                               buttonTextStyle: TextStyle(color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16,
//                                   fontFamily: "Inter"),
//                               rightIcon: Container(
//
//                                   padding: EdgeInsets.fromLTRB(
//                                       7.h, 8.v, 9.h, 7.v),
//                                   margin: EdgeInsets.only(right: 10.h),
//                                   decoration: BoxDecoration(
//                                       color: theme
//                                           .colorScheme.onErrorContainer
//                                           .withOpacity(1),
//                                       borderRadius:
//                                       BorderRadius.circular(14.h)),
//                                   child: CustomImageView(
//                                       imagePath:
//                                       ImageConstant.imgArrowleft,
//                                       height: 12.v,
//                                       width: 11.h)),
//                               buttonStyle:
//                               CustomButtonStyles.outlinePrimary,
//                               onPressed: () {
//                                 provider.applyFilters();
//                                 Navigator.pop(context);
//
//                               }),
//                         ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 isScrollControlled: true,
//               );
//             },
//             rightIcon: Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.only(left: 5.h),
//               child: Row(
//                 children: [
//                   CustomImageView(
//                     alignment: Alignment.center,
//                     imagePath: ImageConstant.imgSlidershorizontal,
//                     height: 15.adaptSize,
//                     width: 15.adaptSize,
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     "Filters",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 13.fSize,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             buttonStyle: CustomButtonStyles.fillPrimary,
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildTabview(BuildContext context) {
//     return Container(
//       height: 45.v,
//       width: 337.h,
//       decoration: BoxDecoration(
//         color: appTheme.blueGray50,
//         borderRadius: BorderRadius.circular(
//           10.h,
//         ),
//       ),
//       child: TabBar(
//         indicatorSize: TabBarIndicatorSize.tab,
//         controller: tabviewController,
//         labelPadding: EdgeInsets.zero,
//         labelColor: theme.colorScheme.onErrorContainer.withOpacity(1),
//         labelStyle: TextStyle(
//           fontSize: 14.fSize,
//           fontFamily: 'Inter',
//           fontWeight: FontWeight.w600,
//         ),
//         unselectedLabelColor: theme.colorScheme.secondaryContainer,
//         unselectedLabelStyle: TextStyle(
//           fontSize: 14.fSize,
//           fontFamily: 'Inter',
//           fontWeight: FontWeight.w600,
//         ),
//         indicatorPadding: EdgeInsets.all(
//           6.0.h,
//         ),
//         indicator: BoxDecoration(
//           color: theme.colorScheme.primary,
//           borderRadius: BorderRadius.circular(
//             6.h,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: appTheme.black900.withOpacity(0.05),
//               spreadRadius: 2.h,
//               blurRadius: 2.h,
//               offset: Offset(
//                 0,
//                 3,
//               ),
//             ),
//           ],
//         ),
//         tabs: [
//           Tab(
//             child: Text(
//               "lbl_upcoming".tr,
//             ),
//           ),
//           Tab(
//             child: Text(
//               "lbl_past_events".tr,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
