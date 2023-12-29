import 'package:flutter/material.dart';

const gap = SizedBox.square(dimension: AppDimens.kDefaultPadding);
const gapS = SizedBox.square(dimension: AppDimens.kPaddingS);
const gapM = SizedBox.square(dimension: AppDimens.kPaddingM);
const gapXL = SizedBox.square(dimension: AppDimens.kPaddingXL);

class AppDimens {
  static const double kMaxWidth = 800;
  static const BoxConstraints kBoxConstraints =
      BoxConstraints(maxWidth: kMaxWidth);

  // Padding
  static const double kPaddingXS = 2;
  static const double kPaddingS = 4;
  static const double kPaddingM = 8;
  static const double kDefaultPadding = 16;
  static const double kPaddingXL = 32;
  static const double kPaddingXXL = 64;

  // Radius and Border
  static const double defaultRadius = 16;
  static BorderRadius defaultBorder({double radius = defaultRadius}) =>
      BorderRadius.circular(radius);
  static const Offset defaultOffset = Offset(5, 5);
  static const double defaultBlurRadius = 10;
}
