import 'package:flutter/material.dart';
import 'package:store/ui/shared/costum_widget/costum_text.dart';
import 'package:store/ui/shared/shared_widget/app_colors.dart';

class CostumContainer extends StatelessWidget {
  final double width;
  final double hieght;
  final IconData? icon;
  final String? text;
  final Color? color;
  final double? fontsize;
  const CostumContainer(
      {super.key,
      required this.width,
      required this.hieght,
      this.icon,
      this.text,
      this.color,
      this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: hieght,
        decoration: BoxDecoration(
            color: color ?? AppColors.Indigo,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: icon != null
              ? Icon(
                  icon,
                  color: AppColors.white,
                )
              : CustomText(
                  text: text,
                  styleType: TextStyleType.BODY,
                  textColor: AppColors.white,
                  fontSize: fontsize ?? null,
                ),
        ));
  }
}
