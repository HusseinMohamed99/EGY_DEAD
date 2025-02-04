part of './../../../core/helpers/export_manager/export_manager.dart';

class MoviesSimilar extends Equatable {
  final int id;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIds;
  final String? backdropPath;
  final String? posterPath;
  final bool adult;

  const MoviesSimilar({
    required this.overview,
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.genreIds,
    this.backdropPath,
    required this.releaseDate,
    this.posterPath,
    required this.adult,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        overview,
        genreIds,
        posterPath,
        adult,
        releaseDate,
      ];
}
