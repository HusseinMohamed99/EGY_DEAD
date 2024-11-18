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
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        if (state.tvsDetailsStates == RequestState.loading) {
          return LoadingTvsDetailsContent();
        } else if (state.tvsDetailsStates == RequestState.loaded) {
          return TvsDetailsContentLoaded(state: state);
        } else {
          return BuildErrorMessage(errorMessage: state.tvsDetailsMessage);
        }
      },
    );
  }
}

class TvsDetailsContentLoaded extends StatelessWidget {
  const TvsDetailsContentLoaded({
    super.key,
    required this.state,
  });

  final TvsDetailsStates state;

  @override
  Widget build(BuildContext context) {
    final sections = [
      SeriesDescription(state: state),
      BuildTabBarSection(),
    ];
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SingleChildScrollView(
        key: const Key('tvDetailScrollView'),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CinemaBackdropWidget(
              backdropPath: state.tvsDetails?.backdropPath ?? '',
            ),
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
      ),
    );
  }
}

class BuildTabBarSection extends StatelessWidget {
  const BuildTabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelPadding: EdgeInsets.zero,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade700,
          indicatorColor: Colors.redAccent,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            TapsWidget(title: AppString.seasons),
            TapsWidget(title: AppString.recommendations),
            TapsWidget(title: AppString.moreLikeThis),
          ],
        ),
        SizedBox(
          width: double.maxFinite,
          height: 500.h,
          child: TabBarView(
            children: [
              ShowSeasonSeries(),
              ShowRecommendationSeries(),
              ShowSimilarSeries(),
            ],
          ),
        ),
      ],
    );
  }
}

class SeriesDescription extends StatelessWidget {
  const SeriesDescription({
    super.key,
    required this.state,
  });

  final TvsDetailsStates state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SeriesInfoRow(state: state),
        Space(height: 16, width: 0),
        CinemaOverviewAndGenres(
          overview: state.tvsDetails!.overview,
          genres: state.tvsDetails!.genres,
        ),
      ],
    );
  }
}

class SeriesInfoRow extends StatelessWidget {
  const SeriesInfoRow({
    super.key,
    required this.state,
  });

  final TvsDetailsStates state;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PosterPathWidget(posterImage: state.tvsDetails?.posterPath ?? ''),
        Space(width: 16, height: 0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WatchTrailerButton(
                trailerUrl: state.tvsDetails?.trailerUrl ?? '',
              ),
              Space(height: 16, width: 0),
              CinemaTitle(title: state.tvsDetails!.name),
              Space(height: 16, width: 0),
              CinemaAttributes(
                releaseDate: state.tvsDetails!.firstDate.split('-')[0],
                rate: state.tvsDetails!.voteAverage.toStringAsFixed(1),
                duration: state.tvsDetails!.runtime.isNotEmpty
                    ? state.tvsDetails!.runtime[0]
                    : 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LoadingTvsDetailsContent extends StatelessWidget {
  const LoadingTvsDetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SingleChildScrollView(
        key: const Key('tvDetailScrollView'),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CachedImage(
                  imageUrl: ApiConstance.imageURL(''),
                  width: double.infinity,
                  height: 250.h,
                  boxFit: BoxFit.fill,
                ),
                Padding(
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
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16).r,
                                  child: CachedImage(
                                    imageUrl: ApiConstance.imageURL(
                                      '',
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
                                  backgroundColor: ColorManager.primaryRedColor,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.play_circle,
                                      color: ColorManager.whiteColor,
                                    ),
                                  ),
                                ),
                                Space(height: 10, width: 0),
                                Text(
                                  'Series Name',
                                  style: context.textTheme.titleLarge,
                                ),
                                Space(height: 8.h, width: 0),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.h,
                                        horizontal: 8.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorManager.greyDarkColor,
                                        borderRadius:
                                            BorderRadius.circular(4.0).r,
                                      ),
                                      child: Text(
                                        '2021',
                                        style: context.textTheme.labelMedium,
                                      ),
                                    ),
                                    Space(height: 0, width: 16.w),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: ColorManager.iconRateColor,
                                          size: 20.sp,
                                        ),
                                        Space(height: 0, width: 4.w),
                                        Text(
                                          '9.0',
                                          style: context.textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                    Space(height: 0, width: 16.w),
                                    Expanded(
                                      child: Text(
                                        _showDuration(
                                          120,
                                        ),
                                        style: context.textTheme.labelMedium!
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
                              'Overview',
                              style: context.textTheme.titleMedium,
                            ),
                            Space(height: 8.h, width: 0),
                            Text(
                              'Genres: ${_showGenres([
                                    Genres(
                                      id: 1,
                                      name: 'Action',
                                    ),
                                    Genres(
                                      id: 2,
                                      name: 'Adventure',
                                    ),
                                  ])}',
                              style: context.textTheme.labelSmall!.copyWith(
                                color: ColorManager.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Space(height: 5, width: 0),
                TabBar(
                  labelPadding: EdgeInsets.zero,
                  labelColor: ColorManager.whiteColor,
                  unselectedLabelColor: ColorManager.greyColor,
                  indicatorColor: ColorManager.primaryRedColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    TapsWidget(title: AppString.seasons),
                    TapsWidget(title: AppString.recommendations),
                    TapsWidget(title: AppString.moreLikeThis),
                  ],
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 500.h,
                  child: TabBarView(
                    children: [
                      ShowSeasonSeries(),
                      ShowRecommendationSeries(),
                      ShowSimilarSeries(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShowSeasonSeries extends StatelessWidget {
  const ShowSeasonSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        if (state.tvsDetailsStates == RequestState.loading) {
          return LoadingTapSeriesSkeletonWidget();
        } else if (state.tvsDetailsStates == RequestState.loaded) {
          return ListView.separated(
            padding: const EdgeInsets.all(16).r,
            itemCount: state.tvsDetails!.season.length,
            itemBuilder: (context, index) {
              final season = state.tvsDetails!.season[index];
              return SeasonsLoadedItem(season: season);
            },
            separatorBuilder: (context, index) => Space(height: 20.h, width: 0),
          );
        } else {
          return BuildErrorMessage(
            errorMessage: state.tvsDetailsMessage,
          );
        }
      },
    );
  }
}

class SeasonsLoadedItem extends StatelessWidget {
  const SeasonsLoadedItem({
    super.key,
    required this.season,
  });

  final Season season;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
        border: Border.all(
          color: ColorManager.whiteColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(right: 50.w),
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
                  imageUrl: ApiConstance.imageURL(season.posterPath),
                  width: 100.w,
                  height: 90.h,
                  boxFit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              season.name,
              style: context.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class TapsWidget extends StatelessWidget {
  const TapsWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: FadeInUp(
        from: 20,
        duration: const Duration(milliseconds: 500),
        child: Text(
          title,
          style: context.textTheme.labelSmall,
        ),
      ),
    );
  }
}

class ShowRecommendationSeries extends StatelessWidget {
  const ShowRecommendationSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        if (state.tvsRecommendationStates == RequestState.loading) {
          return LoadingTapSeriesSkeletonWidget();
        } else if (state.tvsRecommendationStates == RequestState.loaded) {
          return RecommendationLoadedListView(state: state);
        } else {
          return BuildErrorMessage(
            errorMessage: state.tvsRecommendationMessage,
          );
        }
      },
    );
  }
}

class RecommendationLoadedListView extends StatelessWidget {
  const RecommendationLoadedListView({
    super.key,
    required this.state,
  });
  final TvsDetailsStates state;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      itemCount: state.tvsRecommendation.length,
      itemBuilder: (context, index) {
        final recommendation = state.tvsRecommendation[index];
        return LoadedItem(
          iD: recommendation.id,
          backdropPath: recommendation.backdropPath ?? '',
        );
      },
      separatorBuilder: (context, index) {
        return Space(height: 20.h, width: 0);
      },
    );
  }
}

class LoadedItem extends StatelessWidget {
  const LoadedItem({
    super.key,
    required this.iD,
    required this.backdropPath,
  });

  final int iD;
  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TvsDetailsScreen(tvsID: iD),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(
            color: ColorManager.whiteColor,
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)).r,
          child: CachedImage(
            imageUrl: ApiConstance.imageURL(backdropPath),
            width: 100.w,
            height: 100.h,
            boxFit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SimilarLoadedListView extends StatelessWidget {
  const SimilarLoadedListView({
    super.key,
    required this.state,
  });
  final TvsDetailsStates state;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      itemCount: state.tvsSimilar.length,
      itemBuilder: (context, index) {
        final similar = state.tvsSimilar[index];
        return LoadedItem(
          iD: similar.id,
          backdropPath: similar.backdropPath ?? '',
        );
      },
      separatorBuilder: (context, index) {
        return Space(height: 20.h, width: 0);
      },
    );
  }
}

class ShowSimilarSeries extends StatelessWidget {
  const ShowSimilarSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        if (state.tvsSimilarStates == RequestState.loading) {
          return LoadingTapSeriesSkeletonWidget();
        } else if (state.tvsSimilarStates == RequestState.loaded) {
          return SimilarLoadedListView(state: state);
        } else {
          return BuildErrorMessage(
            errorMessage: state.tvsSimilarMessage,
          );
        }
      },
    );
  }
}

class LoadingTapSeriesSkeletonWidget extends StatelessWidget {
  const LoadingTapSeriesSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            border: Border.all(
              color: ColorManager.whiteColor,
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)).r,
            child: CachedImage(
              imageUrl: ApiConstance.imageURL(''),
              width: 100.w,
              height: 100.h,
              boxFit: BoxFit.fill,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Space(height: 20.h, width: 0),
    ).skeletonize(
      enabled: true,
    );
  }
}
