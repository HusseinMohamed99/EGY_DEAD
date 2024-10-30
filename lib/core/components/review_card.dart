part of './../helpers/export_manager/export_manager.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({
    required this.review,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;
    return GestureDetector(
      onTap: () {
        showCustomBottomSheet(context, ReviewContent(review: review));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        width: 240.w,
        height: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.charCoolColor,
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: Avatar(avatarUrl: review.avatarUrl),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.authorName,
                        style: textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        review.authorUserName,
                        style: textTheme.bodySmall,
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
              style: textTheme.labelSmall,
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
      itemSize: 16.sp,
      unratedColor: ColorManager.greyColor,
      itemBuilder: (_, __) {
        return Icon(
          Icons.star_rate_rounded,
          color: ColorManager.iconRateColor,
          size: 24.sp,
        );
      },
    );
  } else {
    return const SizedBox();
  }
}
