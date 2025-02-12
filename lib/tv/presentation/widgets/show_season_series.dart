part of '../../../core/helpers/export_manager/export_manager.dart';

class ShowSeasonSeries extends StatelessWidget {
  const ShowSeasonSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        if (state.tvsDetailsStates == RequestState.loading) {
          return SeasonSeriesLoaded(state: state).skeletonize();
        } else if (state.tvsDetailsStates == RequestState.loaded) {
          return SeasonSeriesLoaded(state: state);
        } else {
          return BuildErrorMessage(
            errorMessage: state.tvsDetailsMessage,
          );
        }
      },
    );
  }
}

class SeasonSeriesLoaded extends StatelessWidget {
  const SeasonSeriesLoaded({
    super.key,
    required this.state,
  });
  final TvsDetailsStates state;
  @override
  Widget build(BuildContext context) {
    if (state.tvsDetails?.season.isEmpty ?? true) {
      return Image.asset(
        Assets.imagesNoData,
        height: 100.h,
        width: 100.w,
      );
    } else {
      return SeriesListView(
        itemCount: state.tvsDetails!.season.length,
        itemBuilder: (context, index) {
          final season = state.tvsDetails!.season[index];
          return SeriesLoadedItem(
            imageUrl: season.posterPath,
            episodeCount: season.episodeCount.toString(),
            name: season.name,
          );
        },
      );
    }
  }
}
