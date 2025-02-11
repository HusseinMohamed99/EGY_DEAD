part of './../../core/helpers/export_manager/export_manager.dart';

void navigateToTvSeeMore({
  required BuildContext context,
  required TvSeeMoreModel tvModel,
}) {
  context.pushNamed(Routes.tvSeeMoreScreen, arguments: tvModel);
}

class TvSeeMoreModel {
  TvSeeMoreModel({
    required this.tvList,
    required this.title,
  });
  final List<Tvs> tvList;
  final String title;
}
