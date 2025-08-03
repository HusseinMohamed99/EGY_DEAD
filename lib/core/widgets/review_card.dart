part of '../helpers/export_manager/export_manager.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    required this.review,
    super.key,
  });
  final Review review;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCustomBottomSheet(
          context,
          ReviewContent(review: review),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        width: 240.w,
        height: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.darkPrimary,
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: CachedImage(
                    imageUrl: review.avatarUrl,
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.authorName,
                        style: TextStyleManager.labelMedium(context: context),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        review.authorUserName,
                        style: TextStyleManager.bodySmall(context: context),
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
              style: TextStyleManager.labelSmall(context: context),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getRatingBarIndicator(review.rating),
                Text(
                  review.elapsedTime,
                  style: TextStyleManager.bodySmall(context: context),
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
      itemBuilder: (_, _) {
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
