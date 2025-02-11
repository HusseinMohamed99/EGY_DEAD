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
          style: TextStyleManager.labelMedium(context: context),
        ),
        const Space(height: 8, width: 0),
        Text.rich(
          TextSpan(
            text: '${AppString.genres}: ',
            style: TextStyleManager.labelMedium(context: context),
            children: [
              TextSpan(
                text: _showGenres(genres),
                style: TextStyleManager.labelSmall(
                  context: context,
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
