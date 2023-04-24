import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/core/utls/enums/request_state.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movies_events.dart';
import 'package:movies_app/movies/presentation/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularUseCase;
  final GetTopRatedMoviesUseCase getTopRatedUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularUseCase,
      this.getTopRatedUseCase)
      : super(const MoviesStates()) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase(const NoParameter());

      result.fold(
          (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(state.copyWith(
              nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
    });

    on<GetPopularEvent>((event, emit) async {
      final result = await getPopularUseCase(const NoParameter());
      result.fold(
          (l) => emit(state.copyWith(
              popularState: RequestState.error, popularMessage: l.message)),
          (r) => emit(state.copyWith(
              popularState: RequestState.loaded, popularMovies: r)));
    });

    on<GetTopRatedEvent>((event, emit) async {
      final result = await getTopRatedUseCase(const NoParameter());
      result.fold(
          (l) => emit(state.copyWith(
              topRatedStates: RequestState.error, topRatedMessage: l.message)),
          (r) => emit(state.copyWith(
              topRatedStates: RequestState.loaded, topRatedMovies: r)));
    });
  }
}
