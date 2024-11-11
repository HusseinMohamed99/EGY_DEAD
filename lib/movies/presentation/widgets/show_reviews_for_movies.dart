part of './../../../core/helpers/export_manager/export_manager.dart';

class ShowReviewsForMovies extends StatelessWidget {
  const ShowReviewsForMovies(
    this.reviews, {
    super.key,
  });
  final List<Review>? reviews;
  @override
  Widget build(BuildContext context) {
    return (reviews?.isNotEmpty ?? false)
        ? SectionCastOrReviewsListView(
            height: 150.h,
            itemCount: reviews!.length,
            itemBuilder: (context, index) => ReviewCard(
              review: reviews?[index] ??
                  Review(
                    authorName: '',
                    content: '',
                    rating: 0.0,
                    elapsedTime: '',
                    avatarUrl: '',
                    authorUserName: '',
                  ),
            ),
          )
        : NoDataFoundWidget(
            message: 'No reviews found.',
            imagePath: Assets.imagesNoData,
          );
  }
}
