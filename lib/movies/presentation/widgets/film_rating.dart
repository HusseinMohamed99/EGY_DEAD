part of './../../../core/helpers/export_manager/export_manager.dart';

class FilmRating extends StatelessWidget {
  const FilmRating({super.key, required this.moviesDetailsStates});

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: ColorManager.iconRateColor, size: 24.sp),
        Text(
          moviesDetailsStates.moviesDetails?.voteAverage.toStringAsFixed(1) ??
              '',
          style: context.textTheme.labelMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
