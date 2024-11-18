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
        CinemaOverviewAndGenres(
          overview: moviesDetailsStates.moviesDetails?.overview ?? "",
          genres: moviesDetailsStates.moviesDetails?.genres ?? [],
        ),
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
        PosterPathWidget(
            posterImage: moviesDetailsStates.moviesDetails?.posterPath ?? ''),
        Space(height: 0, width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WatchTrailerButton(
                trailerUrl: moviesDetailsStates.moviesDetails?.trailerUrl ?? '',
              ),
              Space(height: 16, width: 0),
              CinemaTitle(
                  title: moviesDetailsStates.moviesDetails?.title ?? ''),
              Space(height: 16, width: 0),
              CinemaAttributes(
                releaseDate: moviesDetailsStates.moviesDetails?.releaseDate
                        .split('-')[0] ??
                    "",
                rate: moviesDetailsStates.moviesDetails?.voteAverage
                        .toStringAsFixed(1) ??
                    '',
                duration: moviesDetailsStates.moviesDetails?.runtime ?? 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
