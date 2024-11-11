part of './../../../core/helpers/export_manager/export_manager.dart';

class MovieDescriptionPanel extends StatelessWidget {
  const MovieDescriptionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
      builder: (context, state) {
        // Loading state
        if (state.moviesDetailsStates == RequestState.loading) {
          return Skeletonizer(
            child: MovieDetailsDisplay(moviesDetailsStates: state),
          );
        }

        // Loaded state
        if (state.moviesDetailsStates == RequestState.loaded) {
          return MovieDetailsDisplay(moviesDetailsStates: state);
        }

        // Error or FetchData state
        else {
          return SizedBox(
            height: 300.h,
            child: Center(
              child: Text(
                state.moviesDetailsMessage,
                style: context.textTheme.titleLarge,
              ),
            ),
          );
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
    return SingleChildScrollView(
      key: const Key('movieDetailScrollView'),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CinemaBackdropWidget(moviesDetailsStates: moviesDetailsStates),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                child:
                    FilmDescription(moviesDetailsStates: moviesDetailsStates),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                child: ShowCast(moviesDetailsStates: moviesDetailsStates),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                child: ShowReviews(moviesDetailsStates: moviesDetailsStates),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                child: ShowRecommendations(
                  moviesDetailsStates: moviesDetailsStates,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                child: ShowSimilar(
                  moviesDetailsStates: moviesDetailsStates,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
