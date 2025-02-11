part of './../../../core/helpers/export_manager/export_manager.dart';

class NowPlayingCarousel extends StatelessWidget {
  const NowPlayingCarousel({super.key, required this.movies});
  final List<Movies> movies;
  @override
  Widget build(BuildContext context) {
    return BuildCarouselWidget(
      items: movies.map((movie) => BuildCarouselItem(movie: movie)).toList(),
    );
  }
}

class BuildCarouselItem extends StatelessWidget {
  const BuildCarouselItem({
    super.key,
    required this.movie,
  });
  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return CarouselItem(
      navigateToDetailsSection: () {
        navigateToDetailsSection(context, movie.id);
      },
      imageUrl: ApiConstance.imageURL(movie.backdropPath),
      title: movie.title,
      sectionName: AppString.nowPlaying,
    );
  }
}
