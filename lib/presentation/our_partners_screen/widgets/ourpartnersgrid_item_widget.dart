import '../models/ourpartnersgrid_item_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurpartnersgridItemWidget extends StatelessWidget {
  OurpartnersgridItemWidget(this.partner, {Key? key}) : super(key: key);

  final Partner partner;

  // Function to open the link in the browser
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Open the partner link when the image is tapped
        _launchURL(partner.link.toString());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              partner.image.toString(),
              fit: BoxFit.contain,
              height: 60,
              width: 60,
            ),
          ),
        ),
      ),
    );
  }
}




// CustomImageView(
// imagePath: ourpartnersgridItemModelObj.image,
// height: 45.adaptSize,
// width: 45.adaptSize,
// ),