part of './../../../core/helpers/export_manager/export_manager.dart';

void navigateToMovieDetails(BuildContext context, int movieID) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MovieDetailsScreen(movieID: movieID),
    ),
  );
}
