part of './../../../core/helpers/export_manager/export_manager.dart';

class FilmAttributes extends StatelessWidget {
  const FilmAttributes({super.key, required this.moviesDetailsStates});

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilmReleaseDate(moviesDetailsStates: moviesDetailsStates),
        ),
        Space(height: 0, width: 8),
        Expanded(
          child: FilmRating(moviesDetailsStates: moviesDetailsStates),
        ),
        Space(height: 0, width: 8),
        Expanded(
          child: FilmDuration(moviesDetailsStates: moviesDetailsStates),
        ),
      ],
    );
  }
}
