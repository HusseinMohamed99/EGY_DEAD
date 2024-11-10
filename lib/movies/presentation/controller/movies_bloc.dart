part of './../../../core/helpers/export_manager/export_manager.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;
  final GetAllPopularMoviesUseCase allPopularMoviesUseCase;
  final GetAllTopRatedMoviesUseCase allTopRatedMoviesUseCase;
  final GetAllUpcomingMoviesUseCase allUpcomingMoviesUseCase;

  // final GetPopularMoviesUseCase getPopularMoviesUseCase;
  MoviesBloc(
      this.getNowPlayingMoviesUseCase,
      this.getUpcomingMoviesUseCase,
      this.allUpcomingMoviesUseCase,
      this.allTopRatedMoviesUseCase,
      this.allPopularMoviesUseCase)
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    // on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetPopularMoviesEvent>(_getAllPopularMovies);
    on<GetTopRatedMoviesEvent>(_getAllTopRatedMovies);
    on<GetUpcomingMoviesEvent>(_getAllUpcomingMovies);
    on<FetchMorePopularMoviesEvent>(_fetchMoreMovies);
    on<FetchMoreTopRatedMoviesEvent>(_fetchMoreTopRatedMovies);
    on<FetchMoreUpcomingMoviesEvent>(_fetchMoreUpcomingMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
    return null;
  }

  // FutureOr<void> _getPopularMovies(
  //     GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
  //   final result = await getPopularMoviesUseCase(const NoParameters());
  //   result.fold(
  //       (l) => emit(state.copyWith(
  //           popularState: GetAllRequestStatus.error,
  //           popularMessage: l.message)),
  //       (r) => emit(state.copyWith(
  //           popularState: GetAllRequestStatus.loaded, popularMovies: r)));
  // }

  int page = 1;

  Future<void> _getAllPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    if (state.popularState == RequestState.loading) {
      await _getMoviesPopular(emit);
    } else if (state.popularState == RequestState.loaded) {
      await _getMoviesPopular(emit);
    } else {
      emit(
        state.copyWith(
          popularState: RequestState.loading,
        ),
      );
      await _getMoviesPopular(emit);
    }
  }

  Future<void> _getMoviesPopular(Emitter<MoviesStates> emit) async {
    final result = await allPopularMoviesUseCase(page);
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
        ),
      ),
      (r) {
        page++;
        emit(
          state.copyWith(
            popularState: RequestState.loaded,
            popularMovies: state.popularMovies + r,
          ),
        );
      },
    );
  }

  Future<void> _fetchMoreMovies(
      FetchMorePopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await allPopularMoviesUseCase(page);
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.fetchData,
        ),
      ),
      (r) {
        page++;
        return emit(
          state.copyWith(
            popularState: RequestState.fetchData,
            popularMovies: state.popularMovies + r,
          ),
        );
      },
    );
  }

  // FutureOr<void> _getTopRatedMovies(
  //     GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
  //   final result = await getTopRatedMoviesUseCase(const NoParameters());
  //   result.fold(
  //       (l) => emit(state.copyWith(
  //           topRatedStates: GetAllRequestStatus.error,
  //           topRatedMessage: l.message)),
  //       (r) => emit(state.copyWith(
  //           topRatedStates: GetAllRequestStatus.loaded, topRatedMovies: r)));
  // }

  Future<void> _getAllTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    if (state.topRatedStates == RequestState.loading) {
      await _getTopRatedMovies(emit);
    } else if (state.topRatedStates == RequestState.loaded) {
      await _getTopRatedMovies(emit);
    } else {
      emit(
        state.copyWith(
          topRatedStates: RequestState.loading,
        ),
      );
      await _getTopRatedMovies(emit);
    }
  }

  Future<void> _getAllUpcomingMovies(
      GetUpcomingMoviesEvent event, Emitter<MoviesStates> emit) async {
    if (state.upcomingState == RequestState.loading) {
      await _getUpcomingMovies(emit);
    } else if (state.topRatedStates == RequestState.loaded) {
      await _getUpcomingMovies(emit);
    } else {
      emit(
        state.copyWith(
          upcomingState: RequestState.loading,
        ),
      );
      await _getUpcomingMovies(emit);
    }
  }

  FutureOr<void> _getUpcomingMovies(Emitter<MoviesStates> emit) async {
    final result = await allUpcomingMoviesUseCase(page);

    result.fold((l) {
      emit(
        state.copyWith(
          upcomingState: RequestState.error,
          upcomingMessage: l.message,
        ),
      );
    }, (r) {
      page++;
      emit(
        state.copyWith(
          upcomingState: RequestState.loaded,
          upcomingMovies: state.upcomingMovies + r,
        ),
      );
    });
    return null;
  }

  Future<void> _getTopRatedMovies(Emitter<MoviesStates> emit) async {
    final result = await allTopRatedMoviesUseCase(page);
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedStates: RequestState.error,
        ),
      ),
      (r) {
        page++;
        emit(
          state.copyWith(
            topRatedStates: RequestState.loaded,
            topRatedMovies: state.topRatedMovies + r,
          ),
        );
      },
    );
  }

  Future<void> _fetchMoreTopRatedMovies(
      FetchMoreTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await allTopRatedMoviesUseCase(page);
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedStates: RequestState.fetchData,
        ),
      ),
      (r) {
        page++;
        return emit(
          state.copyWith(
            topRatedStates: RequestState.fetchData,
            topRatedMovies: state.topRatedMovies + r,
          ),
        );
      },
    );
  }

  Future<void> _fetchMoreUpcomingMovies(
      FetchMoreUpcomingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await allUpcomingMoviesUseCase(page);
    result.fold(
      (l) => emit(
        state.copyWith(
          upcomingState: RequestState.fetchData,
        ),
      ),
      (r) {
        page++;
        return emit(
          state.copyWith(
            upcomingState: RequestState.fetchData,
            upcomingMovies: state.upcomingMovies + r,
          ),
        );
      },
    );
  }
}
