import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: theme.colorScheme.onErrorContainer.withOpacity(1),
                  borderRadius: BorderRadius.circular(18.h),
                  border: Border.all(
                    color: theme.colorScheme.onErrorContainer.withOpacity(1),
                    width: 1.h,
                  ),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        borderRadius: BorderRadius.circular(15.h),
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
    color: appTheme.whiteA700,
    borderRadius: BorderRadius.circular(18.h),
    border: Border.all(
      color: appTheme.whiteA700,
      width: 1.h,
    ),
  );
  static BoxDecoration get fillOnErrorContainerTL7 => BoxDecoration(
        color: theme.colorScheme.onErrorContainer.withOpacity(0.4),
        borderRadius: BorderRadius.circular(7.h),
      );
  static BoxDecoration get fillOnErrorContainerTL71 => BoxDecoration(
        color: theme.colorScheme.onErrorContainer.withOpacity(0.7),
        borderRadius: BorderRadius.circular(7.h),
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(6.h),
      );
}
