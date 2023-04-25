import 'package:movies_app/core/utils/enums/request_state.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MoviesDetailsStates extends Equatable {
  final MovieDetails? moviesDetails;
  final RequestState moviesDetailsStates;
  final String moviesDetailsMessage;

  const MoviesDetailsStates({
    this.moviesDetails,
    this.moviesDetailsStates = RequestState.loading,
    this.moviesDetailsMessage = "",
  });

  MoviesDetailsStates copyWith({
    MovieDetails? moviesDetails,
    RequestState? moviesDetailsStates,
    String? moviesDetailsMessage,
  }) {
    return MoviesDetailsStates(
      moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
      moviesDetails: moviesDetails ?? this.moviesDetails,
      moviesDetailsStates: moviesDetailsStates ?? this.moviesDetailsStates,
    );
  }

  @override
  List<Object?> get props => [
        moviesDetails,
        moviesDetailsMessage,
        moviesDetailsStates,
      ];
}
