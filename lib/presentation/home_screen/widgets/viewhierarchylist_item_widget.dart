
import 'package:adabfest/presentation/home_screen/models/Banner.dart';

import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewhierarchylistItemWidget extends StatelessWidget {
  ViewhierarchylistItemWidget(
      this.banner, {
        Key? key,
        this.onTapImgStackImage,
      }) : super(
    key: key,
  );

  Banners banner;
  VoidCallback? onTapImgStackImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          height: 130.v,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: banner.image, // Assuming 'bannerImage' is the property in MainBanner class holding the image path
                height: 130.v,
                width: 336.h,
                radius: BorderRadius.circular(
                  10.h,
                ),
                alignment: Alignment.center,
                onTap: () {
                  onTapImgStackImage?.call();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
