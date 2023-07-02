import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_app/core/components/circle_avatar.dart';
import 'package:movies_app/core/components/review_content.dart';
import 'package:movies_app/core/global/theme/theme_data/theme_data_dark.dart';
import 'package:movies_app/core/utils/function.dart';
import 'package:movies_app/movies/domain/entities/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({
    required this.review,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeDataDark().textTheme;
    return InkWell(
      onTap: () {
        showCustomBottomSheet(context, ReviewContent(review: review));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 240,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Avatar(avatarUrl: review.avatarUrl),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.authorName,
                        style: textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        review.authorUserName,
                        style: textTheme.bodyLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              review.content,
              style: textTheme.bodyLarge,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getRatingBarIndicator(review.rating),
                Text(
                  review.elapsedTime,
                  style: textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _getRatingBarIndicator(double rating) {
  if (rating != -1) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 16,
      unratedColor: Colors.white54,
      itemBuilder: (_, __) {
        return const Icon(
          Icons.star_rate_rounded,
          color: Colors.yellow,
        );
      },
    );
  } else {
    return const SizedBox();
  }
}
