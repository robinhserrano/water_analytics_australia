import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({this.height, this.width, super.key});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: Shimmer.fromColors(
        baseColor: const Color(0xffe0e0e0),
        highlightColor: const Color(0xfff3f3f3),
        child: SizedBox(height: height ?? 50, child: const Card()),
      ),
    );
  }
}
