import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/components/cast_card.dart';
import 'package:movies_app/core/components/loading_indicator.dart';
import 'package:movies_app/core/components/review_card.dart';
import 'package:movies_app/core/global/app_string/app_string.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/core/utils/function.dart';
import 'package:movies_app/movies/domain/entities/cast.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';
import 'package:movies_app/movies/domain/entities/review.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_events.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_states.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieID;

  const MovieDetailsScreen({Key? key, required this.movieID}) : super(key: key);

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
  const MovieDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
      builder: (context, state) {
        switch (state.moviesDetailsStates) {
          case RequestState.loading:
            return const SizedBox(height: 400, child: LoadingIndicator());

          case RequestState.loaded:
            return SingleChildScrollView(
              key: const Key('movieDetailScrollView'),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        imageUrl: ApiConstance.imageURL(
                            state.moviesDetails!.backdropPath),
                        fit: BoxFit.fill,
                      ),
                      FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        imageUrl: ApiConstance.imageURL(
                                            state.moviesDetails!.posterPath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.red,
                                          child: IconButton(
                                              onPressed: () {
                                                urlLauncher(
                                                  Uri.parse(state.moviesDetails
                                                          ?.trailerUrl ??
                                                      ''),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.play_circle,
                                                color: Colors.white,
                                              )),
                                        ),
                                        Text(state.moviesDetails!.title,
                                            style: GoogleFonts.poppins(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.2,
                                            )),
                                        const SizedBox(height: 8.0),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 2.0,
                                                horizontal: 8.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[800],
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Text(
                                                state.moviesDetails!.releaseDate
                                                    .split('-')[0],
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 16.0),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 20.0,
                                                ),
                                                const SizedBox(width: 4.0),
                                                Text(
                                                  (state.moviesDetails!
                                                              .voteAverage /
                                                          2)
                                                      .toStringAsFixed(1),
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                                const SizedBox(width: 4.0),
                                                Text(
                                                  '(${state.moviesDetails!.voteAverage})',
                                                  style: const TextStyle(
                                                    fontSize: 1.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 16.0),
                                            Expanded(
                                              child: Text(
                                                _showDuration(state
                                                    .moviesDetails!.runtime),
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1.2,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.moviesDetails!.overview,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      'Genres: ${_showGenres(state.moviesDetails!.genres)}',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
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
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            AppString.cast,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                      _getCast(state.moviesDetails!.cast),
                      FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            AppString.reviews,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                      _getReviews(state.moviesDetails!.reviews),
                      FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            AppString.recommendations,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                      _showRecommendations(),
                      FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            AppString.moreLikeThis,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                      _showSimilar(),
                      const SizedBox(height: 20),
                    ],
                  ),
                  Positioned(
                    top: 40,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 22,
                      child: IconButton(
                        alignment: Alignment.center,
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_circle_left_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          case RequestState.error:
            return SizedBox(
                height: 400,
                child: Center(child: Text(state.moviesDetailsMessage)));
        }
      },
    );
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

  Widget _showRecommendations() {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
      builder: (context, state) {
        switch (state.moviesRecommendationStates) {
          case RequestState.loading:
            return const SizedBox(
                height: 400, child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.moviesRecommendation.length,
                  itemBuilder: (context, index) {
                    final recommendation = state.moviesRecommendation[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
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
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white)),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              height: double.infinity,
                              width: 120.0,
                              fit: BoxFit.cover,
                              imageUrl: ApiConstance.imageURL(
                                  recommendation.backdropPath!),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
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
                height: 400,
                child: Center(child: Text(state.moviesRecommendationMessage)));
        }
      },
    );
  }

  Widget _showSimilar() {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
      builder: (context, state) {
        switch (state.moviesSimilarStates) {
          case RequestState.loading:
            return const SizedBox(
                height: 400, child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.moviesSimilar.length,
                  itemBuilder: (context, index) {
                    final similar = state.moviesSimilar[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
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
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white)),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              height: double.infinity,
                              width: 120.0,
                              fit: BoxFit.cover,
                              imageUrl:
                                  ApiConstance.imageURL(similar.backdropPath!),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
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
                height: 400,
                child: Center(child: Text(state.moviesSimilarMessage)));
        }
      },
    );
  }

  Widget _getCast(List<Cast>? cast) {
    if (cast != null && cast.isNotEmpty) {
      return SectionListView(
        height: 170,
        itemCount: cast.length,
        itemBuilder: (context, index) => CastCard(
          cast: cast[index],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _getReviews(List<Review>? reviews) {
    if (reviews != null && reviews.isNotEmpty) {
      return SectionListView(
        height: 175,
        itemCount: reviews.length,
        itemBuilder: (context, index) => ReviewCard(
          review: reviews[index],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
