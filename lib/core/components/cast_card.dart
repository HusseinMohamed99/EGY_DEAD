import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/components/cached_image.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/movies/domain/entities/cast.dart';

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard({
    required this.cast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8).r,
            child: CachedImage(
              imageUrl: cast.profileUrl,
              width: double.infinity,
              height: 100.h,
            ),
          ),
          Space(height: 8, width: 0),
          Text(
            cast.name,
            style: textTheme.bodyLarge,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
