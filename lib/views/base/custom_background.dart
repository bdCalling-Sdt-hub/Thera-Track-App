import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/utils/app_colors.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;

  const CustomBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
      color: AppColors.whiteColor
      ),
      child: child,
    );
  }
}
