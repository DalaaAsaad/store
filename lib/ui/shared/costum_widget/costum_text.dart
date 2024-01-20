import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared_widget/app_colors.dart';
import '../shared_widget/utils.dart';

enum TextStyleType {
  TITLE,
  SUBTITLE,
  BODY,
  SMALL,
  CUSTOM,
}

class CustomText extends StatelessWidget {
  final String? text;
  final TextStyleType? styleType;
  final Color? textColor;

  final FontWeight? fontWeight;
  final double? fontSize;
  final bool? isLine;

  const CustomText({
    super.key,
    required this.text,
    this.styleType = TextStyleType.BODY,
    this.textColor = AppColors.black,
    this.fontWeight,
    this.fontSize,
    this.isLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: getStyle(Get.size),
    );
  }

  TextStyle getStyle(Size size) {
    TextStyle result = TextStyle();

    switch (styleType) {
      case TextStyleType.TITLE:
        result = TextStyle(
            fontSize: screenWidth(11),
            fontWeight: fontWeight ?? FontWeight.w600,
            color: textColor);
        break;
      case TextStyleType.SUBTITLE:
        result = TextStyle(
            fontSize: screenWidth(24),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.BODY:
        result = TextStyle(
            fontSize: fontSize ?? screenWidth(18),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.SMALL:
        result = TextStyle(
            fontSize: screenWidth(35),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.CUSTOM:
        result = TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
            decorationColor: AppColors.red,
            decorationThickness: 3,
            decoration: isLine ?? false ? TextDecoration.underline : null);
        break;

      default:
        result = TextStyle(
            fontSize: screenWidth(28),
            fontWeight: FontWeight.normal,
            color: textColor);
        break;
    }

    return result;
  }
}
