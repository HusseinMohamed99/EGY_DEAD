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
