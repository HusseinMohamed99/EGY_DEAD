part of './../../../core/helpers/export_manager/export_manager.dart';

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
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      itemCount: state.tvsDetails?.season.length ?? 0,
      itemBuilder: (context, index) {
        final season = state.tvsDetails!.season[index];
        return SeasonsLoadedItem(season: season);
      },
      separatorBuilder: (context, index) => Space(height: 20, width: 0),
    );
  }
}
