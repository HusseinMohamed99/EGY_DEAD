import 'package:flutter/material.dart';
import 'package:movies_app/core/components/image_shimmer.dart';
import 'package:movies_app/core/components/size_box.dart';
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
      width: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ImageWithShimmer(
              imageUrl: cast.profileUrl,
              width: double.infinity,
              height: 130,
            ),
          ),
          const Space(height: 8, width: 0),
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
