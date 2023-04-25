import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.overview,
      required super.id,
      required super.title,
      required super.voteAverage,
      required super.backdropPath,
      required super.releaseDate,
      required super.posterPath,
      required super.adult,
      required super.genres,
      required super.runtime});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      overview: json["overview"],
      id: json["id"],
      title: json["title"],
      voteAverage: json["vote_average"].toDouble(),
      backdropPath: json["backdrop_path"],
      releaseDate: json["release_date"],
      posterPath: json["poster_path"],
      adult: json['adult'],
      genres: List<GenresModel>.from(
          json["genres"].map((e) => GenresModel.fromJson(e))),
      runtime: json["runtime"],
    );
  }
}
