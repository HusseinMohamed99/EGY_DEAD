import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/global/theme/style/color_manger.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.boxFit,
  });

  final String imageUrl;
  final double height;
  final double width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: boxFit ?? BoxFit.cover,
      errorWidget: (_, __, ___) => Icon(
        Icons.error,
        color: ColorManager.primaryRedColor,
        size: 24.sp,
      ),
    );
  }
}
