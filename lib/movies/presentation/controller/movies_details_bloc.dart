import 'dart:async';
import 'package:movies_app/core/utils/enums/request_state.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_events.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsStates> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MoviesDetailsBloc(this.getMovieDetailsUseCase)
      : super(const MoviesDetailsStates()) {
    on<GetMoviesDetailsEvent>(_getMovieDetails);
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
  }
}
