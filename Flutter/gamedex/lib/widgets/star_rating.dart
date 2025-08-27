import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final bool readOnly;
  final double starSize;
  final RatingChangeCallback onRatingChanged;

  const StarRating({
    this.starSize = 25,
    this.starCount = 5,
    this.rating = 0.0,
    this.readOnly = false,
    required this.onRatingChanged,
    super.key,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Theme.of(context).colorScheme.onSurface,
        size: starSize,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: Theme.of(context).colorScheme.primary,
        size: starSize * 1.13,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: Theme.of(context).colorScheme.primary,
        size: starSize * 1.2,
      );
    }
    if (!readOnly){
      return InkResponse(
          onTap: () => onRatingChanged(index + 1.0),
          child: icon,
      );
    } else{
      return InkResponse(child: icon,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) => buildStar(context, index)),
    );
  }
}
