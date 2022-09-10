import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmerEffectUI extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  // ignore: use_key_in_widget_constructors
  MyShimmerEffectUI.rectangular(
      {this.width = double.infinity, required this.height})
      : shapeBorder =
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));

  // ignore: use_key_in_widget_constructors
  const MyShimmerEffectUI.circular(
      {this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade500,
        highlightColor: Colors.grey.shade100,
        period: const Duration(seconds: 4),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey,
            shape: shapeBorder,
          ),
        ),
      );
}
