part of '../helpers/export_manager/export_manager.dart';

class HorizontalMoviesListViewCard extends StatelessWidget {
  const HorizontalMoviesListViewCard({
    super.key,
    required this.movies,
  });
  final Movies? movies;

  @override
  Widget build(BuildContext context) {
    return ContentDisplayCard(
      navigateToDetailsSection: () {
        navigateToDetailsSection(context, movies?.id ?? 0);
      },
      imageUrl: ApiConstance.imageURL(movies?.backdropPath ?? ''),
    );
  }
}
