part of '../../../core/helpers/export_manager/export_manager.dart';

void navigateToSeeMore({
  required BuildContext context,
  required List<Movies> movies,
  required String title,
  required VoidCallback addEvent,
  required bool fetchData,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MovieSeeMoreScreen(
        fetchData: fetchData,
        movieList: movies,
        title: title,
        addEvent: addEvent,
      ),
    ),
  );
}
