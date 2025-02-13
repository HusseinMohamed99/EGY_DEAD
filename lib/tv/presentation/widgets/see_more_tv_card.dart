part of '../../../core/helpers/export_manager/export_manager.dart';

class SeeMoreTvCard extends StatelessWidget {
  const SeeMoreTvCard({
    super.key,
    required this.tvs,
  });
  final Tvs tvs;

  @override
  Widget build(BuildContext context) {
    return BuildSeeMoreCardItem(
      imageUrl: ApiConstance.imageURL(tvs.backdropPath),
      overview: tvs.overview,
      releaseDate: tvs.firstAirDate,
      title: tvs.name,
      rating: tvs.voteAverage,
      onTap: () => navigateToTvDetails(context, tvs.id),
    );
  }
}
