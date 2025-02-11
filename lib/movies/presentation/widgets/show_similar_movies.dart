part of './../../../core/helpers/export_manager/export_manager.dart';

class ShowSimilar extends StatelessWidget {
  const ShowSimilar({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.moreLikeThis,
          style: TextStyleManager.titleSmall(context: context),
        ),
        const Space(height: 8, width: 0),
        const ShowSimilarMovies(),
      ],
    );
  }
}

class ShowSimilarMovies extends StatelessWidget {
  const ShowSimilarMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
      builder: (context, state) {
        if (state.moviesDetailsStates == RequestState.loading) {
          return SizedBox(height: 170.h, child: const LoadingIndicator());
        } else if (state.moviesDetailsStates == RequestState.loaded) {
          return SimilarMovieListView(moviesDetailsStates: state);
        } else {
          return BuildErrorMessage(errorMessage: state.moviesDetailsMessage);
        }
      },
    );
  }
}

class SimilarMovieListView extends StatelessWidget {
  const SimilarMovieListView({super.key, required this.moviesDetailsStates});
  final MoviesDetailsStates moviesDetailsStates;
  @override
  Widget build(BuildContext context) {
    return HorizontalListView(
      padding: EdgeInsets.only(right: 8.w),
      itemBuilder: (context, index) {
        final similar = moviesDetailsStates.moviesSimilar[index];
        return ContentDisplayCard(
          navigateToDetailsSection: () {
            navigateToDetailsSection(context, similar.id);
          },
          imageUrl: ApiConstance.imageURL(similar.backdropPath ?? ''),
        );
      },
      itemCount: moviesDetailsStates.moviesSimilar.length,
    );
  }
}
