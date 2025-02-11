part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildMovieCard extends StatelessWidget {
  const BuildMovieCard({
    super.key,
    required this.movie,
  });
  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildContainerDecoration(),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: () => navigateToMovieDetails(context, movie.id),
        child: Row(
          children: [
            Container(
              decoration: buildContainerDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0).r,
                child: CachedImage(
                  boxFit: BoxFit.fill,
                  imageUrl: ApiConstance.imageURL(movie.backdropPath),
                  width: 120.w,
                  height: 120.h,
                ),
              ),
            ),
            const Space(height: 0, width: 10),
            Expanded(
              child: BuildMovieCardInfo(movie: movie),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildMovieCardInfo extends StatelessWidget {
  const BuildMovieCardInfo({
    super.key,
    required this.movie,
  });

  final Movies movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          movie.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyleManager.titleMedium(context: context),
        ),
        BuildReleaseDateChip(releaseDate: movie.releaseDate),
        BuildRating(rating: movie.voteAverage),
        Text(
          movie.overview,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyleManager.labelSmall(context: context),
        ),
      ],
    );
  }
}
