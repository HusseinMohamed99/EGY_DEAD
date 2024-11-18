part of './../../../core/helpers/export_manager/export_manager.dart';

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
