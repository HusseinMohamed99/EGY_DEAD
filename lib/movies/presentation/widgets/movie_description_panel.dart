part of './../../../core/helpers/export_manager/export_manager.dart';

class MovieDescriptionPanel extends StatelessWidget {
  const MovieDescriptionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
      builder: (context, state) {
        if (state.moviesDetailsStates == RequestState.loading) {
          return MovieDetailsDisplay(moviesDetailsStates: state).skeletonize();
        } else if (state.moviesDetailsStates == RequestState.loaded) {
          return MovieDetailsDisplay(moviesDetailsStates: state);
        } else {
          return BuildErrorMessage(errorMessage: state.moviesDetailsMessage);
        }
      },
    );
  }
}

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
      ShowCast(moviesDetailsStates: moviesDetailsStates),
      ShowReviews(moviesDetailsStates: moviesDetailsStates),
      ShowRecommendations(moviesDetailsStates: moviesDetailsStates),
      ShowSimilar(moviesDetailsStates: moviesDetailsStates),
    ];

    return SingleChildScrollView(
      key: const Key('movieDetailScrollView'),
      child: Stack(
        children: [
          Column(
            children: [
              CinemaBackdropWidget(
                  backdropPath:
                      moviesDetailsStates.moviesDetails?.backdropPath ?? ''),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: sections
                    .map(
                      (section) => PaddedSection(child: section),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
