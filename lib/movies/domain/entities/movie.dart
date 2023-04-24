import 'package:equatable/equatable.dart';

class Movies  extends Equatable {
  final String overview;
  final int id;
  final String title;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIds;
  final String ? backdropPath;

  const Movies(
  {
    required this.overview,
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.genreIds,
     this.backdropPath="",
    required this.releaseDate
}
      );

  @override
  // TODO: implement props
  List<Object> get props =>[
    id,
    title,
    backdropPath??"",
    overview,
    genreIds,
  ] ;

}
