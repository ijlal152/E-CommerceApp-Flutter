import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingStars extends StatelessWidget {
  RatingStars({Key? key}) : super(key: key);

  final List<Color> color = [
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.grey.withOpacity(0.3),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: color.map((e) => Icon(Icons.star, size: 25.h, color: e,)).toList(),
    );
  }
}
