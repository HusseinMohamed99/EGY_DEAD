part of './../../../core/helpers/export_manager/export_manager.dart';

class FilmDuration extends StatelessWidget {
  const FilmDuration({super.key, required this.moviesDetailsStates});

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Text(
      _showDuration(moviesDetailsStates.moviesDetails?.runtime ?? 0),
      style: context.textTheme.labelMedium!.copyWith(color: Colors.grey),
    );
  }
}
