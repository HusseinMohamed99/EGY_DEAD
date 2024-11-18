part of './../../../core/helpers/export_manager/export_manager.dart';

class ShowRecommendationSeries extends StatelessWidget {
  const ShowRecommendationSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        if (state.tvsRecommendationStates == RequestState.loading) {
          return RecommendationLoadedListView(state: state).skeletonize();
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
