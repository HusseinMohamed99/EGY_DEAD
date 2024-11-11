part of './../../../core/helpers/export_manager/export_manager.dart';

class FilmDescription extends StatelessWidget {
  const FilmDescription({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilmInfoRow(moviesDetailsStates: moviesDetailsStates),
        Space(height: 16, width: 0),
        FilmOverviewAndGenres(moviesDetailsStates: moviesDetailsStates),
      ],
    );
  }
}

class FilmInfoRow extends StatelessWidget {
  const FilmInfoRow({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PosterPathWidget(moviesDetailsStates: moviesDetailsStates),
        Space(height: 0, width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonTrailerFilms(moviesDetailsStates: moviesDetailsStates),
              Space(height: 16, width: 0),
              FilmTitle(moviesDetailsStates: moviesDetailsStates),
              Space(height: 16, width: 0),
              FilmAttributes(moviesDetailsStates: moviesDetailsStates),
            ],
          ),
        ),
      ],
    );
  }
}

class FilmTitle extends StatelessWidget {
  const FilmTitle({super.key, required this.moviesDetailsStates});

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Text(
      moviesDetailsStates.moviesDetails?.title ?? '',
      textAlign: TextAlign.center,
      style: context.textTheme.titleLarge,
    );
  }
}
