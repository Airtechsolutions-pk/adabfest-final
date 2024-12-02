import 'package:adabfest/presentation/past_events_empty_page/widget/itemcardwidget.dart';

import '../../data/models/GlobalEvents/EventsModals.dart';
import 'models/past_events_empty_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/past_events_empty_provider.dart';

// ignore_for_file: must_be_immutable
class PastEventsEmptyPage extends StatefulWidget {
  final EventsModels? eventsAllModelList;

  const PastEventsEmptyPage({Key? key,this.eventsAllModelList})
      : super(
          key: key,
        );

  @override
  PastEventsEmptyPageState createState() => PastEventsEmptyPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PastEventsEmptyProvider(),
      child: PastEventsEmptyPage(),
    );
  }
}

class PastEventsEmptyPageState extends State<PastEventsEmptyPage>
    with AutomaticKeepAliveClientMixin<PastEventsEmptyPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnErrorContainer,
          child: widget.eventsAllModelList!.eventcategories!.isEmpty ? Column(
            children: [
              SizedBox(height: 113.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 81.h,
                  right: 91.h,
                ),
                child: Column(
                  children: [


                    Container(
                      height: 202.adaptSize,
                      width: 202.adaptSize,
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      decoration: AppDecoration.fillGray20001.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder101,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgGroup,
                        height: 157.adaptSize,
                        width: 157.adaptSize,
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                    SizedBox(height: 27.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "msg_no_upcoming_event".tr,
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 20.fSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
           ) :  Column(
            children: [
              SizedBox(height: 16.v),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.h),
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10.v);
                      },
                      itemCount:  widget.eventsAllModelList!.eventcategories?.length ?? 0 ,
                      itemBuilder: (context, categoryIndex) {
                        Eventcategories category =
                        widget.eventsAllModelList!.eventcategories![categoryIndex];
                        print("------category ${category}");

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Display category information here if needed

                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: category.events?.length ?? 0,
                              itemBuilder: (context, eventIndex) {
                                Events model = category.events![eventIndex];
                                return Eventcard4ItemWidget(
                                  model,

                                );
                              },
                            ),
                          ],
                        );
                      },

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
