import '../past_events_page/widgets/eventcardlist3_item_widget.dart';
import 'models/eventcardlist3_item_model.dart';
import 'models/past_events_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/past_events_provider.dart';

// ignore_for_file: must_be_immutable
class PastEventsPage extends StatefulWidget {
  const PastEventsPage({Key? key})
      : super(
          key: key,
        );

  @override
  PastEventsPageState createState() => PastEventsPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PastEventsProvider(),
      child: PastEventsPage(),
    );
  }
}

class PastEventsPageState extends State<PastEventsPage>
    with AutomaticKeepAliveClientMixin<PastEventsPage> {
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
        backgroundColor: appTheme.gray50,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              SizedBox(height: 16.v),
              _buildEventCardList(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEventCardList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.h),
        child: Consumer<PastEventsProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 10.v,
                );
              },
              itemCount:
                  provider.pastEventsModelObj.eventcardlist3ItemList.length,
              itemBuilder: (context, index) {
                Eventcardlist3ItemModel model =
                    provider.pastEventsModelObj.eventcardlist3ItemList[index];
                return Eventcardlist3ItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
