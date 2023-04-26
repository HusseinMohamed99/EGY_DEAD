import 'package:movies_app/core/utils/enums/request_state.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movie_recommendation.dart';

class MoviesDetailsStates extends Equatable {
  final MovieDetails? moviesDetails;
  final RequestState moviesDetailsStates;
  final String moviesDetailsMessage;

  final List<MoviesRecommendation> moviesRecommendation;
  final RequestState moviesRecommendationStates;
  final String moviesRecommendationMessage;

  const MoviesDetailsStates({
    this.moviesDetails,
    this.moviesDetailsStates = RequestState.loading,
    this.moviesDetailsMessage = "",
    this.moviesRecommendation = const [],
    this.moviesRecommendationStates = RequestState.loading,
    this.moviesRecommendationMessage = "",
  });

  MoviesDetailsStates copyWith({
    MovieDetails? moviesDetails,
    RequestState? moviesDetailsStates,
    String? moviesDetailsMessage,
    List<MoviesRecommendation>? moviesRecommendation,
    RequestState? moviesRecommendationStates,
    String? moviesRecommendationMessage,
  }) {
    return MoviesDetailsStates(
      moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
      moviesDetails: moviesDetails ?? this.moviesDetails,
      moviesDetailsStates: moviesDetailsStates ?? this.moviesDetailsStates,
      moviesRecommendation: moviesRecommendation ?? this.moviesRecommendation,
      moviesRecommendationStates:
          moviesRecommendationStates ?? this.moviesRecommendationStates,
      moviesRecommendationMessage:
          moviesRecommendationMessage ?? this.moviesRecommendationMessage,
    );
  }

  @override
  List<Object?> get props =>
      [
        moviesDetails,
        moviesDetailsMessage,
        moviesDetailsStates,
        moviesRecommendation,
        moviesRecommendationMessage,
        moviesRecommendationStates,
      ];
}
