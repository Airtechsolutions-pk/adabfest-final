import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Bodoni text style
  static get bodoniModaBlack900 => TextStyle(
    color: appTheme.black900.withOpacity(0.03),
    fontSize: 112.fSize,
    fontWeight: FontWeight.w700,
  ).bodoniModa;
  // Body text style
  static get bodyLargeAnekGurmukhiOnPrimary =>
      theme.textTheme.bodyLarge!.anekGurmukhi.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get titleMediumWhiteA700_1 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.whiteA700,
  );
  static get bodyLargeDMSansOnErrorContainer =>
      theme.textTheme.bodyLarge!.dMSans.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get headlineSmallInterOnPrimary =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyLargeInterOnErrorContainer =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get bodyMediumAirbnbCerealApp =>
      theme.textTheme.bodyMedium!.airbnbCerealApp;
  static get bodyMediumAirbnbCerealAppOnPrimary =>
      theme.textTheme.bodyMedium!.airbnbCerealApp.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 13.fSize,
      );
  static get bodyMediumAnekGurmukhiBlack900 =>
      theme.textTheme.bodyMedium!.anekGurmukhi.copyWith(
        color: appTheme.black900,
        fontSize: 15.fSize,
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.black900,
    fontSize: 14.fSize,
  );
  static get bodyMediumDMSansGray70001 =>
      theme.textTheme.bodyMedium!.dMSans.copyWith(
        color: appTheme.gray70001,
        fontSize: 14.fSize,
      );
  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray700,
    fontSize: 14.fSize,
  );
  static get bodyMediumGray70001 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray70001,
    fontSize: 14.fSize,
  );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
    color: theme.colorScheme.onPrimary,
    fontSize: 13.fSize,
  );
  static get bodySmallDMSansBlack900 =>
      theme.textTheme.bodySmall!.dMSans.copyWith(
        color: appTheme.black900,
      );
  static get bodySmallDMSansBlack90010 =>
      theme.textTheme.bodySmall!.dMSans.copyWith(
        color: appTheme.black900,
        fontSize: 10.fSize,
      );
  static get bodySmallDMSansOnErrorContainer =>
      theme.textTheme.bodySmall!.dMSans.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get bodySmallGray700 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray700,
  );
  static get bodySmallOnErrorContainer => theme.textTheme.bodySmall!.copyWith(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
  );
  // Headline text style
  static get headlineMediumDMSansBlack900 =>
      theme.textTheme.headlineMedium!.dMSans.copyWith(
        color: appTheme.black900,
        fontSize: 29.fSize,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallDMSans => theme.textTheme.headlineSmall!.dMSans;
  static get headlineSmallDMSansBlack900 =>
      theme.textTheme.headlineSmall!.dMSans.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallDMSansOnErrorContainer =>
      theme.textTheme.headlineSmall!.dMSans.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get headlineSmallDMSansOnErrorContainerSemiBold =>
      theme.textTheme.headlineSmall!.dMSans.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallOnErrorContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontWeight: FontWeight.w900,
      );
  static get headlineSmallOnErrorContainer_1 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
    color: theme.colorScheme.primary,
    fontWeight: FontWeight.w600,
  );
  static get headlineSmallSemiBold => theme.textTheme.headlineSmall!.copyWith(
    fontWeight: FontWeight.w600,
  );
  static get headlineSmall_1 => theme.textTheme.headlineSmall!;
  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.black900,
    fontSize: 13.fSize,
    fontWeight: FontWeight.w500,
  );
  static get labelLargeBlack90013 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.black900,
    fontSize: 13.fSize,
  );
  static get labelLargeBodoniMTOnErrorContainer =>
      theme.textTheme.labelLarge!.bodoniMT.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontSize: 13.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeGray600 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray600,
    fontWeight: FontWeight.w500,
  );
  static get labelLargeGray700 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray700,
  );
  static get labelLargeOnErrorContainer => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
  );
  static get labelLargeOnErrorContainerMedium =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.primary,
    fontWeight: FontWeight.w500,
  );
  static get labelLargePrimaryContainer => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.primaryContainer,
    fontWeight: FontWeight.w500,
  );
  static get labelLargePrimaryContainer_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get labelMediumBlack900 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.black900,
    fontSize: 11.fSize,
  );
  static get labelMediumBlack900Medium => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.black900,
    fontSize: 11.fSize,
    fontWeight: FontWeight.w500,
  );
  static get labelMediumOnErrorContainer =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontSize: 11.fSize,
      );
  static get labelMediumOnErrorContainer11 =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontSize: 11.fSize,
      );
  static get labelMediumOnErrorContainerBold =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.black900,
  );
  static get titleLargeBodoniMTBlack900 =>
      theme.textTheme.titleLarge!.bodoniMT.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeDMSansBlack900 =>
      theme.textTheme.titleLarge!.dMSans.copyWith(
        color: appTheme.black900,
      );
  static get titleLargeOnErrorContainer => theme.textTheme.titleLarge!.copyWith(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    fontWeight: FontWeight.w500,
  );
  static get titleLargeOnPrimary => theme.textTheme.titleLarge!.copyWith(
    color: theme.colorScheme.onPrimary,
    fontWeight: FontWeight.w700,
  );
  static get titleLargeOnPrimary_1 => theme.textTheme.titleLarge!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
    color: theme.colorScheme.primary,
  );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.black900.withOpacity(0.65),
    fontWeight: FontWeight.w600,
  );
  static get titleMediumDMSans => theme.textTheme.titleMedium!.dMSans.copyWith(
    fontSize: 17.fSize,
  );
  static get titleMediumDMSansOnErrorContainer =>
      theme.textTheme.titleMedium!.dMSans.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontSize: 17.fSize,
      );
  static get titleMediumDMSansOnErrorContainerSemiBold =>
      theme.textTheme.titleMedium!.dMSans.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumDMSansOnErrorContainerSemiBold18 =>
      theme.textTheme.titleMedium!.dMSans.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumErrorContainer => theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.errorContainer,
  );
  static get titleMediumGray600 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray600,
    fontWeight: FontWeight.w600,
  );
  static get titleMediumOnErrorContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get titleMediumOnErrorContainerSemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOnErrorContainerSemiBold_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOnErrorContainer_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.black900.withOpacity(0.65),
  );
  static get titleSmallBlack900Medium => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.black900.withOpacity(0.65),
    fontSize: 15.fSize,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallDMSans => theme.textTheme.titleSmall!.dMSans.copyWith(
    fontWeight: FontWeight.w500,
  );
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
    fontSize: 15.fSize,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallMedium15 => theme.textTheme.titleSmall!.copyWith(
    fontSize: 15.fSize,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallOnErrorContainer => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    fontWeight: FontWeight.w500,
  );
  static get titleSmallOnErrorContainer_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.primary,
  );
  static get titleSmallPrimaryMedium => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.primary,
    fontSize: 15.fSize,
    fontWeight: FontWeight.w500,
  );
  static get bodyMediumInter => theme.textTheme.bodyMedium!.inter;
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.whiteA700,
  );
  static get titleSmallWhiteA700Medium => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.whiteA700,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallRed500a6 => theme.textTheme.titleSmall!.copyWith(
    color: Colors.red.shade600,
    fontSize: 15.fSize,
    fontWeight: FontWeight.w500,
  );

  static get titleSmallSecondaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
}

extension on TextStyle {
  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get bodoniModa {
    return copyWith(
      fontFamily: 'Bodoni Moda',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get airbnbCerealApp {
    return copyWith(
      fontFamily: 'Airbnb Cereal App',
    );
  }

  TextStyle get bodoniMT {
    return copyWith(
      fontFamily: 'Bodoni MT',
    );
  }

  TextStyle get anekGurmukhi {
    return copyWith(
      fontFamily: 'Anek Gurmukhi',
    );
  }
}