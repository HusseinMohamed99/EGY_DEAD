import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/tvs/data/model/season_model.dart';
import 'package:movies_app/tvs/domain/entities/tv_details.dart';

class TvsDetailsModel extends TvDetails {
  const TvsDetailsModel({
    required super.overview,
    required super.id,
    required super.name,
    required super.voteAverage,
    required super.backdropPath,
    required super.firstDate,
    required super.lastDate,
    required super.posterPath,
    required super.adult,
    required super.genres,
    required super.runtime,
    required super.numberOfSeason,
    required super.season,
    required super.trailerUrl,
  });

  factory TvsDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvsDetailsModel(
      overview: json["overview"],
      id: json["id"],
      name: json["name"],
      voteAverage: json["vote_average"].toDouble(),
      backdropPath: json["backdrop_path"] ?? '',
      firstDate: json["first_air_date"],
      lastDate: json["last_air_date"],
      posterPath: json["poster_path"] ?? '',
      adult: json['adult'],
      numberOfSeason: json['number_of_seasons'],
      genres: List<TvGenresModel>.from(
          json["genres"].map((e) => TvGenresModel.fromJson(e))),
      season: List<TvSeasonModel>.from(
          json["seasons"].map((e) => TvSeasonModel.fromJson(e))),
      trailerUrl: getTrailerUrl(json),
      runtime: json["episode_run_time"],
    );
  }
}
