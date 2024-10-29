import 'package:movies_app/tvs/domain/entities/season.dart';

class TvSeasonModel extends Season {
  const TvSeasonModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.posterPath,
    required super.airDate,
    required super.seasonNumber,
    required super.episodeCount,
  });

  factory TvSeasonModel.fromJson(Map<String, dynamic> json) {
    return TvSeasonModel(
      id: json["id"],
      name: json["name"],
      airDate: json["air_date"] ?? '',
      posterPath: json["poster_path"] ?? '',
      seasonNumber: json["season_number"],
      episodeCount: json["episode_count"],
      overview: json["overview"],
    );
  }
}
