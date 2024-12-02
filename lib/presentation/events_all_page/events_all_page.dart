import '../../data/models/GlobalEvents/EventsModals.dart';
import '../events_all_page/widgets/eventcard3_item_widget.dart';
import 'models/eventcard3_item_model.dart';
import 'models/events_all_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/events_all_provider.dart';

// ignore_for_file: must_be_immutable
class EventsAllPage extends StatefulWidget {
  final Events? eventsAllModelList;
  const EventsAllPage({Key?key ,  this.eventsAllModelList})
      : super(
          key: key,
        );

  @override
  EventsAllPageState createState() => EventsAllPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventsAllProvider(),
      child: EventsAllPage(),
    );
  }


}

class EventsAllPageState extends State<EventsAllPage>
    with AutomaticKeepAliveClientMixin<EventsAllPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnErrorContainer,
          child: Column(
            children: [
              SizedBox(height: 16.v),
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 19.h),
    //             child: Consumer<EventsAllProvider>(builder: (context, provider, child) {
    //               return ListView.separated(
    //                 physics: NeverScrollableScrollPhysics(),
    //                 shrinkWrap: true,
    //                 separatorBuilder: (context, index) {
    //                   return SizedBox(height: 10.v);
    //                 },
    //                 itemCount:  widget.eventsAllModelList.?.length ?? 0 ,
    //                 itemBuilder: (context, categoryIndex) {
    //                   Eventcategories category =
    //                   widget.eventsAllModelList!.eventcategories![categoryIndex];
    //                   print("------category ${category}");
    //
    //                   return    Eventcard3ItemWidget(
    // model,
    //
    // );
    //                 },
    //               );
    //             }),
    //           ),
            ],
          ),
        ),
      ),
    );
  }



}
