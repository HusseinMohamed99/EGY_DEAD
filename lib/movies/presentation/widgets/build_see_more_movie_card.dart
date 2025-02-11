part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildMovieCard extends StatelessWidget {
  const BuildMovieCard({
    super.key,
    required this.movie,
  });
  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return BuildSeeMoreCardItem(
      imageUrl: ApiConstance.imageURL(movie.backdropPath),
      overview: movie.overview,
      releaseDate: movie.releaseDate,
      title: movie.title,
      rating: movie.voteAverage,
      onTap: () => navigateToDetailsSection(context, movie.id),
    );
  }
}
