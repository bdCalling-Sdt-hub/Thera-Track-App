import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_track_app/utils/style.dart';

class GridViewTile extends StatelessWidget {
  final String label;
  final Widget? child;
  final VoidCallback onTap;

  const GridViewTile({
    Key? key,
    required this.label,
    required this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 192.h,
        decoration: BoxDecoration(
          color: Color(0xFFBADEFB),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child ??
                Icon(
                  Icons.info_outline,
                  size: 40.h,
                  color: Color(0xFF424242),
                ),
            SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppStyles.fontSize18(color: Color(0xFF424242)),
            ),
          ],
        ),
      ),
    );
  }
}
