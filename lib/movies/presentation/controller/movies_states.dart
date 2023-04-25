import 'package:movies_app/core/utils/enums/request_state.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class MoviesStates extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movies> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  final List<Movies> topRatedMovies;
  final RequestState topRatedStates;
  final String topRatedMessage;

  const MoviesStates(
      {this.topRatedMessage = "",
      this.topRatedMovies = const [],
      this.topRatedStates = RequestState.loading,
      this.nowPlayingMovies = const [],
      this.nowPlayingState = RequestState.loading,
      this.nowPlayingMessage = "",
      this.popularMovies = const [],
      this.popularState = RequestState.loading,
      this.popularMessage = ""});

  MoviesStates copyWith({
    List<Movies>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movies>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movies>? topRatedMovies,
    RequestState? topRatedStates,
    String? topRatedMessage,
  }) {
    return MoviesStates(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        popularMessage: popularMessage ?? this.popularMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedStates: topRatedStates ?? this.topRatedStates);
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMessage,
        popularState,
        popularMovies,
        topRatedStates,
        topRatedMovies,
        topRatedMessage
      ];
}
