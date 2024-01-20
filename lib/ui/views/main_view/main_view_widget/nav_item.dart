// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/ui/shared/shared_widget/app_colors.dart';

class NavItem extends StatelessWidget {
  final String svgPicture;
  final bool? isSelected;
  final Function onTap;
  const NavItem(
      {super.key,
      this.isSelected = false,
      required this.onTap,
      required this.svgPicture});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
          child: SvgPicture.asset(
        svgPicture,
        width: 50,
        color: isSelected! ? AppColors.Indigo : AppColors.black,
      )),
    );
  }
}
