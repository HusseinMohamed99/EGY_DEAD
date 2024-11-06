part of './../../../core/helpers/export_manager/export_manager.dart';

void navigateToSeeMore({
  required BuildContext context,
  required List<Movies> movies,
  required String title,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MovieSeeMoreScreen(
        movieList: movies,
        title: title,
      ),
    ),
  );
}
