part of './../../../core/helpers/export_manager/export_manager.dart';

class MoviesStates extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movies> upcomingMovies;
  final RequestState upcomingState;
  final String upcomingMessage;

  final List<Movies> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  final List<Movies> topRatedMovies;
  final RequestState topRatedStates;
  final String topRatedMessage;

  final List<MovieDetails> moviesDetails;
  final RequestState moviesDetailsStates;
  final String moviesDetailsMessage;

  const MoviesStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = "",
    this.upcomingMovies = const [],
    this.upcomingState = RequestState.loading,
    this.upcomingMessage = "",
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = "",
    this.topRatedStates = RequestState.loading,
    this.topRatedMovies = const [],
    this.topRatedMessage = "",
    this.moviesDetails = const [],
    this.moviesDetailsStates = RequestState.loading,
    this.moviesDetailsMessage = "",
  });

  MoviesStates copyWith({
    List<Movies>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movies>? upcomingMovies,
    RequestState? upcomingState,
    String? upcomingMessage,
    List<Movies>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movies>? topRatedMovies,
    RequestState? topRatedStates,
    String? topRatedMessage,
    List<MovieDetails>? moviesDetails,
    RequestState? moviesDetailsStates,
    String? moviesDetailsMessage,
  }) {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      upcomingState: upcomingState ?? this.upcomingState,
      upcomingMessage: upcomingMessage ?? this.upcomingMessage,
      popularMessage: popularMessage ?? this.popularMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedStates: topRatedStates ?? this.topRatedStates,
      moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
      moviesDetails: moviesDetails ?? this.moviesDetails,
      moviesDetailsStates: moviesDetailsStates ?? this.moviesDetailsStates,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        upcomingMovies,
        upcomingState,
        upcomingMessage,
        popularMessage,
        popularState,
        popularMovies,
        topRatedStates,
        topRatedMovies,
        topRatedMessage,
        moviesDetails,
        moviesDetailsMessage,
        moviesDetailsStates,
      ];
}
