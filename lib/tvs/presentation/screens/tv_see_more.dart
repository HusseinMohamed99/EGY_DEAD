part of './../../../core/helpers/export_manager/export_manager.dart';

class TvSeeMoreScreen extends StatelessWidget {
  const TvSeeMoreScreen({
    super.key,
    required this.tvSeeMoreModel,
  });
  final TvSeeMoreModel tvSeeMoreModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, title: '${tvSeeMoreModel.title} Series'),
      body: ExploreAllMoviesOrTvsPage(
        itemCount: tvSeeMoreModel.tvList.length,
        itemBuilder: (context, index) {
          if (index < tvSeeMoreModel.tvList.length) {
            final tvs = tvSeeMoreModel.tvList[index];
            return BuildTvsCard(tvs: tvs);
          } else {
            return const LoadingIndicator();
          }
        },
      ),
    );
  }
}

class BuildTvsCard extends StatelessWidget {
  const BuildTvsCard({
    super.key,
    required this.tvs,
  });
  final Tvs tvs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.darkPrimary,
        borderRadius: BorderRadius.circular(10).r,
        border: Border.all(
          color: ColorManager.whiteColor,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: () => navigateToTvDetails(context, tvs.id),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0).r,
                border: Border.all(
                  color: ColorManager.whiteColor,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0).r,
                child: CachedImage(
                  boxFit: BoxFit.fitHeight,
                  imageUrl: ApiConstance.imageURL(tvs.backdropPath),
                  width: 120.w,
                  height: 140.h,
                ),
              ),
            ),
            const Space(height: 0, width: 10),
            Expanded(
              child: BuildTvsCard(tvs: tvs),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildTvsCardInfo extends StatelessWidget {
  const BuildTvsCardInfo({
    super.key,
    required this.tvs,
  });
  final Tvs tvs;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          tvs.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyleManager.titleMedium(context: context),
        ),
        BuildReleaseDateChip(releaseDate: tvs.firstAirDate),
        BuildRating(rating: tvs.voteAverage),
        Text(
          tvs.overview,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyleManager.labelSmall(context: context),
        ),
      ],
    );
  }
}
