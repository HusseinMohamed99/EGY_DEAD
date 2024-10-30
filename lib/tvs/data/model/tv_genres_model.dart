part of './../../../core/helpers/export_manager/export_manager.dart';

class TvGenresModel extends Genres {
  const TvGenresModel({
    required super.id,
    required super.name,
  });

  factory TvGenresModel.fromJson(Map<String, dynamic> json) {
    return TvGenresModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
