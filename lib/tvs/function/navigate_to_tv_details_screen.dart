part of './../../core/helpers/export_manager/export_manager.dart';

void navigateToTvDetails(BuildContext context, int tvsID) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TvsDetailsScreen(tvsID: tvsID),
    ),
  );
}
