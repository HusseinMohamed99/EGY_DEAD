part of './../../../core/helpers/export_manager/export_manager.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieID;

  const MovieDetailsScreen({super.key, required this.movieID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesDetailsBloc>()
        ..add(GetMoviesDetailsEvent(movieID))
        ..add(GetMoviesRecommendationEvent(movieID))
        ..add(GetMoviesSimilarEvent(movieID)),
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({super.key});

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
                      _getCast(state.moviesDetails!.cast),
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
                      _getReviews(state.moviesDetails!.reviews),
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
                      _showRecommendations(context),
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
                      _showSimilar(context),
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

String _showGenres(List<Genres> genres) {
  String result = '';
  for (var genre in genres) {
    result += '${genre.name}, ';
  }

  if (result.isEmpty) {
    return result;
  }

  return result.substring(0, result.length - 2);
}

String _showDuration(int runtime) {
  final int hours = runtime ~/ 60;
  final int minutes = runtime % 60;

  if (hours > 0) {
    return '${hours}h ${minutes}m';
  } else {
    return '${minutes}m';
  }
}

Widget _showRecommendations(BuildContext context) {
  final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;

  return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
    builder: (context, state) {
      switch (state.moviesRecommendationStates) {
        case RequestState.loading:
          return SizedBox(height: 300.h, child: const LoadingIndicator());
        case RequestState.loaded:
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                itemCount: state.moviesRecommendation.length,
                itemBuilder: (context, index) {
                  final recommendation = state.moviesRecommendation[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8).r,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                              movieID: recommendation.id,
                            ),
                          ),
                        );
                        if (kDebugMode) {
                          print(recommendation.id);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10).r,
                          border: Border.all(
                            color: ColorManager.whiteColor,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ).r,
                          child: CachedImage(
                            imageUrl: ApiConstance.imageURL(
                                recommendation.backdropPath!),
                            width: 120.w,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        case RequestState.error:
          return SizedBox(
            height: 300.h,
            child: Center(
              child: Text(
                state.moviesRecommendationMessage,
                style: textTheme.titleLarge,
              ),
            ),
          );
        case RequestState.fetchData:
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
    },
  );
}

Widget _showSimilar(BuildContext context) {
  final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;

  return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
    builder: (context, state) {
      if (state.moviesSimilarStates == RequestState.loading) {
        return SizedBox(
          height: 300.h,
          child: const LoadingIndicator(),
        );
      }

      if (state.moviesSimilarStates == RequestState.loaded) {
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              itemCount: state.moviesSimilar.length,
              itemBuilder: (context, index) {
                final similar = state.moviesSimilar[index];
                return Container(
                  padding: const EdgeInsets.only(right: 8).r,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(
                            movieID: similar.id,
                          ),
                        ),
                      );
                      if (kDebugMode) {
                        print(similar.id);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10).r,
                        border: Border.all(
                          color: ColorManager.whiteColor,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ).r,
                        child: CachedImage(
                          imageUrl:
                              ApiConstance.imageURL(similar.backdropPath!),
                          width: 120.w,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }

      // Display error or fetch data messages
      final message = state.moviesSimilarStates == RequestState.error
          ? state.moviesSimilarMessage
          : state.moviesDetailsMessage;

      return SizedBox(
        height: 300.h,
        child: NoDataFoundWidget(
          message: message,
          imagePath: Assets.imagesNoData,
        ),
      );
    },
  );
}

Widget _getCast(List<Cast>? cast) {
  return (cast?.isNotEmpty ?? false)
      ? SectionListView(
          height: 140.h,
          itemCount: cast!.length,
          itemBuilder: (context, index) => CastCard(
            cast: cast[index],
          ),
        )
      : NoDataFoundWidget(
          message: 'No cast found.',
          imagePath: Assets.imagesNoData,
        );
}

Widget _getReviews(List<Review>? reviews) {
  return (reviews?.isNotEmpty ?? false)
      ? SectionListView(
          height: 150.h,
          itemCount: reviews!.length,
          itemBuilder: (context, index) => ReviewCard(
            review: reviews[index],
          ),
        )
      : NoDataFoundWidget(
          message: 'No reviews found.',
          imagePath: Assets.imagesNoData,
        );
}

class SectionListView extends StatelessWidget {
  final int itemCount;
  final double height;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const SectionListView({
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        separatorBuilder: (_, __) => Space(
          width: 10.w,
          height: 0,
        ),
      ),
    );
  }
}

class NoDataFoundWidget extends StatelessWidget {
  final String message;
  final String? imagePath;
  final Color backgroundColor;
  final Color messageColor;
  final double fontSize;

  const NoDataFoundWidget({
    super.key,
    this.message = 'No data found.',
    this.imagePath,
    this.backgroundColor = Colors.white,
    this.messageColor = Colors.black,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: 80.0,
                height: 80.0,
              ),
            const SizedBox(height: 16.0),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                color: messageColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
