import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarTrailingIconbuttonTwo extends StatelessWidget {
  AppbarTrailingIconbuttonTwo({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height:25,
          width: 25,
          decoration: IconButtonStyleHelper.fillOnErrorContainerTL7,
          child: CustomImageView(

            imagePath: imagePath,
          ),
        ),
      ),
    );
  }
}
