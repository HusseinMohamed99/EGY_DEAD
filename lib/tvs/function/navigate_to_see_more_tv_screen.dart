part of './../../core/helpers/export_manager/export_manager.dart';

void navigateToTvSeeMore({
  required BuildContext context,
  required List<Tvs> tvModel,
  required String title,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SeeMoreScreen(
        tvsList: tvModel,
        name: title,
      ),
    ),
  );
}
