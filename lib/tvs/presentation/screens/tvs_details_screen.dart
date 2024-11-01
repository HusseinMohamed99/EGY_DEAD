part of './../../../core/helpers/export_manager/export_manager.dart';

class TvsDetailsScreen extends StatelessWidget {
  final int tvsID;

  const TvsDetailsScreen({super.key, required this.tvsID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<TvsDetailsBloc>()
          ..add(GetTvsDetailsEvent(tvsID))
          ..add(GetTvsRecommendationEvent(tvsID))
          ..add(GetTvsSimilarEvent(tvsID));
      },
      child: const Scaffold(
        body: TvsDetailsContent(),
      ),
    );
  }
}

class TvsDetailsContent extends StatelessWidget {
  const TvsDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        switch (state.tvsDetailsStates) {
          case RequestState.loading:
            return SizedBox(height: 250.h, child: const LoadingIndicator());
          case RequestState.loaded:
            return DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Scaffold(
                body: SingleChildScrollView(
                  key: const Key('tvDetailScrollView'),
                  physics: const BouncingScrollPhysics(),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CachedImage(
                            imageUrl: ApiConstance.imageURL(
                                state.tvsDetails!.backdropPath),
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
                                          borderRadius:
                                              BorderRadius.circular(10).r,
                                          border: Border.all(
                                            color: ColorManager.whiteColor,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16).r,
                                              child: CachedImage(
                                                imageUrl: ApiConstance.imageURL(
                                                  state.tvsDetails!.posterPath,
                                                ),
                                                width: 120.w,
                                                height: 150.h,
                                              ),
                                            ),
                                          ],
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
                                                      state.tvsDetails
                                                              ?.trailerUrl ??
                                                          '',
                                                    ),
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.play_circle,
                                                  color:
                                                      ColorManager.whiteColor,
                                                ),
                                              ),
                                            ),
                                            Space(height: 10.h, width: 0),
                                            Text(
                                              state.tvsDetails!.name,
                                              style: textTheme.titleLarge,
                                            ),
                                            Space(height: 8.h, width: 0),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 2.0,
                                                    horizontal: 8.0,
                                                  ).r,
                                                  decoration: BoxDecoration(
                                                    color: ColorManager
                                                        .greyDarkColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                                4.0)
                                                            .r,
                                                  ),
                                                  child: Text(
                                                    state.tvsDetails!.firstDate
                                                        .split('-')[0],
                                                    style:
                                                        textTheme.labelMedium,
                                                  ),
                                                ),
                                                Space(height: 0, width: 16.w),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: ColorManager
                                                          .iconRateColor,
                                                      size: 20.sp,
                                                    ),
                                                    Space(
                                                        height: 0, width: 4.w),
                                                    Text(
                                                      (state.tvsDetails!
                                                              .voteAverage)
                                                          .toStringAsFixed(1),
                                                      style:
                                                          textTheme.labelMedium,
                                                    ),
                                                  ],
                                                ),
                                                Space(height: 0, width: 16.w),
                                                Expanded(
                                                  child: Text(
                                                    _showDuration(
                                                      state.tvsDetails!.runtime
                                                              .isNotEmpty
                                                          ? state.tvsDetails!
                                                              .runtime[0]
                                                          : 0,
                                                    ),
                                                    style: textTheme
                                                        .labelMedium!
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.tvsDetails!.overview,
                                          style: textTheme.titleMedium,
                                        ),
                                        Space(height: 8.h, width: 0),
                                        Text(
                                          'Genres: ${_showGenres(state.tvsDetails!.genres)}',
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
                          Space(height: 5.h, width: 0),
                          TabBar(
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey.shade700,
                            indicatorColor: Colors.redAccent,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(
                                child: FadeInUp(
                                  from: 20,
                                  duration: const Duration(milliseconds: 500),
                                  child: const Text(
                                    AppString.episodes,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: FadeInUp(
                                  from: 20,
                                  duration: const Duration(milliseconds: 500),
                                  child: const Text(
                                    AppString.recommendations,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: FadeInUp(
                                  from: 20,
                                  duration: const Duration(milliseconds: 500),
                                  child: const Text(
                                    AppString.moreLikeThis,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            height: 600.h,
                            child: TabBarView(
                              children: [
                                _showSeasons(),
                                _showRecommendations(context),
                                _showSimilar(context),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 300.h,
              child: Center(
                child: Text(
                  state.tvsDetailsMessage,
                  style: textTheme.labelLarge,
                ),
              ),
            );
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

  Widget _showRecommendations(BuildContext context) {
    final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        switch (state.tvsRecommendationStates) {
          case RequestState.loading:
            return SizedBox(height: 300.h, child: const LoadingIndicator());
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(16),
                itemCount: state.tvsRecommendation.length,
                itemBuilder: (context, index) {
                  final recommendation = state.tvsRecommendation[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8).r,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TvsDetailsScreen(
                              tvsID: recommendation.id,
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
                              recommendation.backdropPath!,
                            ),
                            width: 100.w,
                            height: 100.h,
                            boxFit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Space(
                  height: 20.h,
                  width: 0,
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 300.h,
              child: Center(
                child: Text(
                  state.tvsRecommendationMessage,
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
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        switch (state.tvsSimilarStates) {
          case RequestState.loading:
            return SizedBox(
              height: 300.h,
              child: const LoadingIndicator(),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(16),
                itemCount: state.tvsSimilar.length,
                itemBuilder: (context, index) {
                  final similar = state.tvsSimilar[index];

                  return Container(
                    padding: const EdgeInsets.only(right: 8).r,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TvsDetailsScreen(
                              tvsID: similar.id,
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
                            imageUrl: ApiConstance.imageURL(
                              similar.backdropPath!,
                            ),
                            width: 100.w,
                            height: 100.h,
                            boxFit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Space(
                  height: 20.h,
                  width: 0,
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 300.h,
              child: Center(
                child: Text(
                  state.tvsSimilarMessage,
                  style: textTheme.titleLarge,
                ),
              ),
            );
        }
      },
    );
  }

  Widget _showSeasons() {
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;
        return state.tvsDetails!.season.isEmpty
            ? const LoadingIndicator()
            : ListView.separated(
                padding: const EdgeInsets.all(16).r,
                itemCount: state.tvsDetails!.season.length,
                itemBuilder: (context, index) {
                  final season = state.tvsDetails!.season[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10).r,
                      border: Border.all(
                        color: ColorManager.whiteColor,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 50).r,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ).r,
                            border: Border.all(
                              color: ColorManager.whiteColor,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                            ).r,
                            child: CachedImage(
                              imageUrl: ApiConstance.imageURL(
                                season.posterPath,
                              ),
                              width: 100.w,
                              height: 90.h,
                              boxFit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            season.name,
                            style: textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    Space(height: 20.h, width: 0),
              );
      },
    );
  }
}
