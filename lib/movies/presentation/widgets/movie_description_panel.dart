part of './../../../core/helpers/export_manager/export_manager.dart';

class MovieDescriptionPanel extends StatelessWidget {
  const MovieDescriptionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;

    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
      builder: (context, state) {
        // Loading state
        if (state.moviesDetailsStates == RequestState.loading) {
          return SizedBox(height: 250.h);
        }

        // Loaded state
        if (state.moviesDetailsStates == RequestState.loaded) {
          return Skeletonizer(
            enabled: state.moviesDetailsStates == RequestState.loading,
            child: SingleChildScrollView(
              key: const Key('movieDetailScrollView'),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CachedImage(
                        imageUrl: ApiConstance.imageURL(
                            state.moviesDetails!.backdropPath),
                        width: double.infinity,
                        height: 250.h,
                        boxFit: BoxFit.fill,
                      ),
                      FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0).r,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10).r,
                                      border: Border.all(
                                        color: ColorManager.whiteColor,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10).r,
                                      child: CachedImage(
                                        boxFit: BoxFit.fill,
                                        imageUrl: ApiConstance.imageURL(
                                          state.moviesDetails!.posterPath,
                                        ),
                                        width: 120.w,
                                        height: 150.h,
                                      ),
                                    ),
                                  ),
                                  Space(height: 0, width: 16.w),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 19.r,
                                          backgroundColor:
                                              ColorManager.primaryRedColor,
                                          child: IconButton(
                                            onPressed: () {
                                              urlLauncher(
                                                Uri.parse(
                                                  state.moviesDetails
                                                          ?.trailerUrl ??
                                                      '',
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.play_circle,
                                              color: ColorManager.whiteColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          state.moviesDetails!.title,
                                          style: textTheme.titleLarge,
                                        ),
                                        Space(height: 8.h, width: 0),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 2.0,
                                                horizontal: 8.0,
                                              ).r,
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorManager.greyDarkColor,
                                                borderRadius:
                                                    BorderRadius.circular(4.0)
                                                        .r,
                                              ),
                                              child: Text(
                                                state.moviesDetails!.releaseDate
                                                    .split('-')[0],
                                                style: textTheme.labelMedium,
                                              ),
                                            ),
                                            Space(height: 0, width: 16.w),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: ColorManager
                                                      .iconRateColor,
                                                  size: 20.0.sp,
                                                ),
                                                Space(height: 0, width: 4.w),
                                                Text(
                                                  state.moviesDetails!
                                                      .voteAverage
                                                      .toStringAsFixed(1),
                                                  style: textTheme.labelMedium,
                                                ),
                                              ],
                                            ),
                                            Space(height: 0, width: 16.w),
                                            Expanded(
                                              child: Text(
                                                _showDuration(state
                                                    .moviesDetails!.runtime),
                                                style: textTheme.labelMedium!
                                                    .copyWith(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0).r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.moviesDetails!.overview,
                                      style: textTheme.titleMedium,
                                    ),
                                    Space(height: 8.h, width: 0),
                                    Text(
                                      'Genres: ${_showGenres(state.moviesDetails!.genres)}',
                                      style: textTheme.labelSmall!.copyWith(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(12).r,
                          child: Text(
                            AppString.cast,
                            style: textTheme.labelLarge,
                          ),
                        ),
                      ),
                      ShowCastForMovies(state.moviesDetails!.cast),
                      FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(12).r,
                          child: Text(
                            AppString.reviews,
                            style: textTheme.labelLarge,
                          ),
                        ),
                      ),
                      ShowReviewsForMovies(state.moviesDetails!.reviews),
                      Space(height: 18.h, width: 0),
                      FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(12).r,
                          child: Text(
                            AppString.recommendations,
                            style: textTheme.labelLarge,
                          ),
                        ),
                      ),
                      MovieRecommendationsDisplay(),
                      Space(height: 18.h, width: 0),
                      FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0).r,
                          child: Text(
                            AppString.moreLikeThis,
                            style: textTheme.labelLarge,
                          ),
                        ),
                      ),
                      ShowSimilarMovies(),
                      Space(height: 20.h, width: 0),
                    ],
                  ),
                ],
              ),
            ),
          );
        }

        // Error or FetchData state
        if (state.moviesDetailsStates == RequestState.error ||
            state.moviesDetailsStates == RequestState.fetchData) {
          return SizedBox(
            height: 300.h,
            child: Center(
              child: Text(
                state.moviesDetailsMessage,
                style: textTheme.titleLarge,
              ),
            ),
          );
        }

        return const SizedBox(); // Default case if none of the above states match
      },
    );
  }
}
