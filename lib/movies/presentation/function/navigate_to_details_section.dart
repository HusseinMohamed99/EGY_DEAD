part of './../../../core/helpers/export_manager/export_manager.dart';

void navigateToDetailsSection(BuildContext context, int movieID) {
  context.pushNamed(Routes.movieDetailsScreen, arguments: movieID);
}
