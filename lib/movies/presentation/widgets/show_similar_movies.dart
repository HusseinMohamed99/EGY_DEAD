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
          style: context.textTheme.titleMedium,
        ),
        Space(height: 8, width: 0),
        ShowSimilarMovies(),
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
        if (_isLoaded(state)) {
          return _buildMoviesList(state);
        }

        return _buildNoDataFound(state);
      },
    );
  }

  bool _isLoaded(MoviesDetailsStates state) {
    return state.moviesSimilarStates == RequestState.loaded;
  }

  Widget _buildMoviesList(MoviesDetailsStates state) {
    return SizedBox(
      height: 170.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: state.moviesSimilar.length,
        itemBuilder: (context, index) {
          final similar = state.moviesSimilar[index];
          return _buildMovieItem(context, similar);
        },
      ),
    );
  }

  Widget _buildMovieItem(BuildContext context, MoviesSimilar similar) {
    return Container(
      padding: EdgeInsets.only(right: 8.w),
      child: GestureDetector(
        onTap: () => _navigateToMovieDetails(context, similar.id),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            border: Border.all(color: ColorManager.whiteColor),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ).r,
            child: CachedImage(
              imageUrl: ApiConstance.imageURL(similar.backdropPath!),
              width: 120.w,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetails(BuildContext context, int movieID) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(movieID: movieID),
      ),
    );
    if (kDebugMode) {
      print(movieID);
    }
  }

  Widget _buildNoDataFound(MoviesDetailsStates state) {
    final message = state.moviesSimilarStates == RequestState.error
        ? state.moviesSimilarMessage
        : state.moviesDetailsMessage;

    return NoDataFoundWidget(
      message: message,
      imagePath: Assets.imagesNoData,
    );
  }
}
