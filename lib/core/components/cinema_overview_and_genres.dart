part of '../helpers/export_manager/export_manager.dart';

class CinemaOverviewAndGenres extends StatelessWidget {
  const CinemaOverviewAndGenres(
      {super.key, required this.overview, required this.genres});

  final String overview;
  final List<Genres> genres;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overview,
          style: context.textTheme.titleSmall,
        ),
        Space(height: 8, width: 0),
        Text.rich(
          TextSpan(
            text: "${AppString.genres}: ",
            style: context.textTheme.titleMedium,
            children: [
              TextSpan(
                text: _showGenres(genres),
                style: context.textTheme.labelSmall!.copyWith(
                  color: ColorManager.primaryRedColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
