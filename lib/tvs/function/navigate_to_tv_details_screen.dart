part of './../../core/helpers/export_manager/export_manager.dart';

void navigateToTvDetails(BuildContext context, int tvsID) {
  context.pushNamed(Routes.tvsDetailsScreen, arguments: tvsID);
}
