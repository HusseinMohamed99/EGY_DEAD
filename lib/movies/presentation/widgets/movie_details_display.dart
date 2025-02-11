part of './../../../core/helpers/export_manager/export_manager.dart';

class MovieDetailsDisplay extends StatelessWidget {
  const MovieDetailsDisplay({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    final sections = [
      FilmDescription(moviesDetailsStates: moviesDetailsStates),
      if (moviesDetailsStates.moviesDetails?.cast?.isNotEmpty ?? false)
        ShowCast(moviesDetailsStates: moviesDetailsStates),
      if (moviesDetailsStates.moviesDetails?.reviews?.isNotEmpty ?? false)
        ShowReviews(moviesDetailsStates: moviesDetailsStates),
      if (moviesDetailsStates.moviesRecommendation.isNotEmpty)
        ShowRecommendations(moviesDetailsStates: moviesDetailsStates),
      if (moviesDetailsStates.moviesSimilar.isNotEmpty)
        ShowSimilar(moviesDetailsStates: moviesDetailsStates),
    ];

    return Column(
      children: [
        CinemaBackdropWidget(
            backdropPath:
                moviesDetailsStates.moviesDetails?.backdropPath ?? ''),
        Expanded(
          child: CustomScrollView(
            key: const Key('movieDetailScrollView'),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: sections
                      .map(
                        (section) => PaddedSection(child: section),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
