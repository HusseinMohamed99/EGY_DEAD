part of './../../../core/helpers/export_manager/export_manager.dart';

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
