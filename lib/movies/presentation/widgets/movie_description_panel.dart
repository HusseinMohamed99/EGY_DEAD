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
    final sections = [
      CinemaBackdropWidget(moviesDetailsStates: moviesDetailsStates),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: sections
                .map((section) => _PaddedSection(child: section))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _PaddedSection extends StatelessWidget {
  final Widget child;
  const _PaddedSection({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: child,
    );
  }
}
