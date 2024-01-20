import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store/ui/shared/shared_widget/app_colors.dart';

class RatingBarCostum extends StatelessWidget {
  final double saveRating;

  const RatingBarCostum({
    super.key,
    required this.saveRating,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
        minRating: 1,
        ignoreGestures: true,
        maxRating: 5,
        initialRating: saveRating,
        direction: Axis.horizontal,
        itemSize: 20,
        ratingWidget: RatingWidget(
            full: Icon(Icons.star, color: AppColors.Indigo),
            half: Icon(Icons.star, color: AppColors.Indigo),
            empty: Icon(
              Icons.star_border_outlined,
              color: AppColors.Indigo,
            )),
        onRatingUpdate: (saveRating) {});
  }
}
