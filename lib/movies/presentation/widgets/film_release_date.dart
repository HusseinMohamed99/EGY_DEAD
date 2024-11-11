part of './../../../core/helpers/export_manager/export_manager.dart';

class FilmReleaseDate extends StatelessWidget {
  const FilmReleaseDate({super.key, required this.moviesDetailsStates});

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: ColorManager.charCoolColor,
        borderRadius: BorderRadius.circular(4.0).r,
      ),
      child: Text(
        moviesDetailsStates.moviesDetails?.releaseDate.split('-')[0] ?? "",
        style: context.textTheme.labelMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
