part of './../../../core/helpers/export_manager/export_manager.dart';

class TvSeeMoreScreen extends StatelessWidget {
  const TvSeeMoreScreen({
    super.key,
    required this.tvSeeMoreModel,
  });
  final TvSeeMoreModel tvSeeMoreModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, title: '${tvSeeMoreModel.title} Series'),
      body: ExploreAllMoviesOrTvsPage(
        itemCount: tvSeeMoreModel.tvList.length,
        itemBuilder: (context, index) {
          if (index < tvSeeMoreModel.tvList.length) {
            final tvs = tvSeeMoreModel.tvList[index];
            return SeeMoreTvCard(tvs: tvs);
          } else {
            return const LoadingIndicator();
          }
        },
      ),
    );
  }
}
