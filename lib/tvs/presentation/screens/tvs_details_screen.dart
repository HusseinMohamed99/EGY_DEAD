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
        return RecommendationLoadedItem(
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
