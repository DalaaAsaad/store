import 'package:flutter/material.dart';
import 'package:store/ui/shared/costum_widget/costum_text.dart';

import '../shared_widget/utils.dart';

class CostumRow extends StatelessWidget {
  final String text;
  final double width;
  const CostumRow({super.key, required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: text,
          styleType: TextStyleType.CUSTOM,
          fontWeight: FontWeight.w600,
          fontSize: screenWidth(width),
        ),
        SizedBox(
          width: 20,
        ),
        CustomText(
          text: "SP",
          styleType: TextStyleType.CUSTOM,
          fontWeight: FontWeight.w600,
          fontSize: screenWidth(width),
        ),
      ],
    );
  }
}
