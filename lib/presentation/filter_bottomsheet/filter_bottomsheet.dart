import '../../data/models/GlobalEvents/EventsModals.dart';
import '../../widgets/custom_elevated_button.dart';
import '../past_events_tab_container_page/provider/past_events_tab_container_provider.dart';
import 'models/filter_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/filter_provider.dart';

// ignore_for_file: must_be_immutable
class FilterBottomsheet extends StatefulWidget {
  const FilterBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  FilterBottomsheetState createState() => FilterBottomsheetState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilterProvider(),
      child: FilterBottomsheet(),
    );
  }
}
class FilterBottomsheetState extends State<FilterBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.0,
          bottom: 207.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Divider(
                color: Colors.grey,
                indent: 141.0,
                endIndent: 140.0,
              ),
            ),
            SizedBox(height: 10.0),

            Consumer<FilterProvider>(
              builder: (context, filterProvider, child) {
                return Column(
                  children: [
                    // Existing code...
                    CheckboxListTile(
                      title: Text('Item 1'),
                      value: filterProvider.item1Checked,
                      onChanged: (value) {
                        filterProvider.setItem1Checked(value ?? false);
                      },
                    ),
                    // Modify the following CheckboxListTile widgets
                    CheckboxListTile(
                      title: Text('Category 1'),
                      value: filterProvider.selectedCategories.contains('Category 1'),
                      onChanged: (value) {
                        filterProvider.toggleCategory('Category 1');
                      },
                    ),
                    SizedBox(height: 5.0),
                    CheckboxListTile(
                      title: Text('Category 2'),
                      value: filterProvider.selectedCategories.contains('Category 2'),
                      onChanged: (value) {
                        filterProvider.toggleCategory('Category 2');
                      },
                    ),
                    SizedBox(height: 5.0),
                    CheckboxListTile(
                      title: Text('Category 3'),
                      value: filterProvider.selectedCategories.contains('Category 3'),
                      onChanged: (value) {
                        filterProvider.toggleCategory('Category 3');
                      },
                    ),
                    // Add more CheckboxListTile widgets for additional categories
                  ],
                );
              },
            ),

            _buildSignUpArrowLeft(context),

          ],
        ),
      ),
    );
  }

  Widget _buildSignUpArrowLeft(BuildContext context) {
    return CustomElevatedButton(
        height: 58.v,


        text: "Aply".tr.toUpperCase(),
        buttonTextStyle: TextStyle(color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: "Inter"),
        rightIcon: Container(

            padding: EdgeInsets.fromLTRB(
                7.h, 8.v, 9.h, 7.v),
            margin: EdgeInsets.only(right: 10.h),
            decoration: BoxDecoration(
                color: theme
                    .colorScheme.onErrorContainer
                    .withOpacity(1),
                borderRadius:
                BorderRadius.circular(14.h)),
            child: CustomImageView(
                imagePath:
                ImageConstant.imgArrowleft,
                height: 12.v,
                width: 11.h)),
        buttonStyle:
        CustomButtonStyles.outlinePrimary,
        onPressed: () {


          // Close the bottom sheet
          Navigator.pop(context);
        });
  }

}
