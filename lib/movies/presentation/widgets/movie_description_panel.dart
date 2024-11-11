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

class ShowCast extends StatelessWidget {
  const ShowCast({
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
          AppString.cast,
          style: context.textTheme.titleMedium,
        ),
        Space(height: 8, width: 0),
        ShowCastForMovies(moviesDetailsStates.moviesDetails?.cast),
      ],
    );
  }
}

class ShowReviews extends StatelessWidget {
  const ShowReviews({
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
          AppString.reviews,
          style: context.textTheme.titleMedium,
        ),
        Space(height: 8, width: 0),
        ShowReviewsForMovies(moviesDetailsStates.moviesDetails?.reviews),
      ],
    );
  }
}

class ShowRecommendations extends StatelessWidget {
  const ShowRecommendations({
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
          AppString.recommendations,
          style: context.textTheme.titleMedium,
        ),
        Space(height: 8, width: 0),
        MovieRecommendationsDisplay(),
      ],
    );
  }
}

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

class FilmDescription extends StatelessWidget {
  const FilmDescription({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PosterPathWidget(
              moviesDetailsStates: moviesDetailsStates,
            ),
            Space(height: 0, width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonTrailerFilms(
                    moviesDetailsStates: moviesDetailsStates,
                  ),
                  Space(height: 16, width: 0),
                  Text(
                    moviesDetailsStates.moviesDetails?.title ?? '',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge,
                  ),
                  Space(height: 16, width: 0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.charCoolColor,
                            borderRadius: BorderRadius.circular(4.0).r,
                          ),
                          child: Text(
                            moviesDetailsStates.moviesDetails?.releaseDate
                                    .split('-')[0] ??
                                "",
                            style: context.textTheme.labelMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Space(height: 0, width: 8),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorManager.iconRateColor,
                              size: 24.sp,
                            ),
                            Text(
                              moviesDetailsStates.moviesDetails?.voteAverage
                                      .toStringAsFixed(1) ??
                                  '',
                              style: context.textTheme.labelMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Space(height: 0, width: 8),
                      Expanded(
                        child: Text(
                          _showDuration(
                              moviesDetailsStates.moviesDetails?.runtime ?? 0),
                          style: context.textTheme.labelMedium!.copyWith(
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
        Space(height: 16.h, width: 0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              moviesDetailsStates.moviesDetails?.overview ?? "",
              style: context.textTheme.titleSmall,
            ),
            Space(height: 8.h, width: 0),
            Text.rich(
              TextSpan(
                text: "${AppString.genres}: ",
                style: context.textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: _showGenres(
                      moviesDetailsStates.moviesDetails?.genres ?? [],
                    ),
                    style: context.textTheme.labelSmall!.copyWith(
                      color: ColorManager.primaryRedColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonTrailerFilms extends StatelessWidget {
  const ButtonTrailerFilms({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 19.r,
      backgroundColor: ColorManager.primaryRedColor,
      child: IconButton(
        onPressed: () {
          urlLauncher(
            Uri.parse(
              moviesDetailsStates.moviesDetails?.trailerUrl ?? '',
            ),
          );
        },
        icon: Icon(
          Icons.play_circle,
          color: ColorManager.whiteColor,
          size: 24.sp,
        ),
      ),
    );
  }
}

class PosterPathWidget extends StatelessWidget {
  const PosterPathWidget({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
        border: Border.all(
          color: ColorManager.primaryGreenColor,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10).r,
        child: CachedImage(
          boxFit: BoxFit.fill,
          imageUrl: ApiConstance.imageURL(
            moviesDetailsStates.moviesDetails?.posterPath ?? '',
          ),
          width: 120.w,
          height: 150.h,
        ),
      ),
    );
  }
}

class CinemaBackdropWidget extends StatelessWidget {
  const CinemaBackdropWidget({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return CachedImage(
      imageUrl: ApiConstance.imageURL(
          moviesDetailsStates.moviesDetails?.backdropPath ?? ''),
      width: double.infinity,
      height: 200.h,
      boxFit: BoxFit.fitHeight,
    );
  }
}
