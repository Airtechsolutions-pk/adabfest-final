import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/data/models/messagemodel/MessageModel.dart';
import 'package:flutter/material.dart';
import 'package:adabfest/data/models/speakermodel/speaker_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/src/style.dart' as styleshtml;
// ignore: must_be_immutable
class RectangleItemWidget extends StatelessWidget {
  RectangleItemWidget(
      this.rectangleItemModelObj, {
        Key? key,
      }) : super(key: key);

  final Messages rectangleItemModelObj;

  String getTruncatedHtml(String htmlContent, int maxLength) {
    // Truncate the content and add ellipsis if it exceeds maxLength
    if (htmlContent.length > maxLength) {
      return '${htmlContent.substring(0, maxLength)}...';
    }
    return htmlContent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.h,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 60.adaptSize,
            width: 62.adaptSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60.adaptSize),
              child: CustomImageView(
                alignment: Alignment.center,
                imagePath: rectangleItemModelObj?.image,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    rectangleItemModelObj?.name ?? "N/A",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.fSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 2, left: 4),
                  child: Text(
                    rectangleItemModelObj?.designation ?? "N/A",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.fSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250.v,
                  child: Html(
                    data: getTruncatedHtml(
                      rectangleItemModelObj?.description ?? "Not Available",
                      100, // Maximum character length to show (adjust as needed)
                    ),
                    style: {
                      "body": styleshtml.Style(
                        color: Colors.white,
                        fontSize: FontSize(10),
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w600,
                      ),
                      "a": styleshtml.Style(
                        textDecoration: TextDecoration.none,
                        color: Colors.white,
                      ),
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
