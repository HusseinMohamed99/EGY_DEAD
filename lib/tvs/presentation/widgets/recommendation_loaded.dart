part of './../../../core/helpers/export_manager/export_manager.dart';

class RecommendationLoaded extends StatelessWidget {
  const RecommendationLoaded({
    super.key,
    required this.state,
  });
  final TvsDetailsStates state;
  @override
  Widget build(BuildContext context) {
    if (state.tvsRecommendation.isEmpty) {
      return Image.asset(
        Assets.imagesNoData,
        height: 100.h,
        width: 100.w,
      );
    } else {
      return SeriesListView(
        itemCount: state.tvsRecommendation.length,
        itemBuilder: (context, index) {
          return RecommendationLoadedItem(
            backdropPath: state.tvsRecommendation[index].backdropPath ?? '',
            id: state.tvsRecommendation[index].id,
            name: state.tvsRecommendation[index].name,
          );
        },
      );
    }
  }
}
