part of './../../../core/helpers/export_manager/export_manager.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsStates> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationsUseCase;
  final GetMovieSimilarUseCase getMovieSimilarUseCase;

  MoviesDetailsBloc(this.getMovieDetailsUseCase,
      this.getMovieRecommendationsUseCase, this.getMovieSimilarUseCase)
      : super(const MoviesDetailsStates()) {
    on<GetMoviesDetailsEvent>(_getMovieDetails);
    on<GetMoviesRecommendationEvent>(_getMovieRecommendations);
    on<GetMoviesSimilarEvent>(_getMovieSimilar);
  }

  FutureOr<void> _getMovieDetails(
      GetMoviesDetailsEvent event, Emitter<MoviesDetailsStates> emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsParameters(movieID: event.movieID));
    result.fold(
        (l) => emit(state.copyWith(
            moviesDetailsStates: RequestState.error,
            moviesDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            moviesDetailsStates: RequestState.loaded, moviesDetails: r)));
    return null;
  }

  FutureOr<void> _getMovieRecommendations(GetMoviesRecommendationEvent event,
      Emitter<MoviesDetailsStates> emit) async {
    final result = await getMovieRecommendationsUseCase(
        MovieRecommendationParameters(movieID: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              moviesRecommendationStates: RequestState.error,
              moviesRecommendationMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              moviesRecommendationStates: RequestState.loaded,
              moviesRecommendation: r,
            )));
    return null;
  }

  FutureOr<void> _getMovieSimilar(
      GetMoviesSimilarEvent event, Emitter<MoviesDetailsStates> emit) async {
    final result =
        await getMovieSimilarUseCase(MovieSimilarParameters(movieID: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              moviesSimilarStates: RequestState.error,
              moviesSimilarMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              moviesSimilarStates: RequestState.loaded,
              moviesSimilar: r,
            )));
    return null;
  }
}
