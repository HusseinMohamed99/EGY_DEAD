part of './../../../core/helpers/export_manager/export_manager.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object?> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {}

class GetUpcomingMoviesEvent extends MoviesEvent {}

class GetPopularMoviesEvent extends MoviesEvent {}

class GetTopRatedMoviesEvent extends MoviesEvent {}

class GetMovieDetailsEvent extends MoviesEvent {}

class FetchMoreTopRatedMoviesEvent extends MoviesEvent {}

class FetchMoreUpcomingMoviesEvent extends MoviesEvent {}

class FetchMorePopularMoviesEvent extends MoviesEvent {}

class GetMoviesEvent extends MoviesEvent {}
