part of './../../../core/helpers/export_manager/export_manager.dart';

class FilmOverviewAndGenres extends StatelessWidget {
  const FilmOverviewAndGenres({super.key, required this.moviesDetailsStates});

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          moviesDetailsStates.moviesDetails?.overview ?? "",
          style: context.textTheme.titleSmall,
        ),
        Space(height: 8, width: 0),
        Text.rich(
          TextSpan(
            text: "${AppString.genres}: ",
            style: context.textTheme.titleMedium,
            children: [
              TextSpan(
                text: _showGenres(
                    moviesDetailsStates.moviesDetails?.genres ?? []),
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
