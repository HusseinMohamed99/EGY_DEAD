import 'package:equatable/equatable.dart';

abstract class TvsEvent extends Equatable {
  const TvsEvent();

  @override
  List<Object?> get props => [];
}

class GetOnTheAirTvsEvent extends TvsEvent {}

class GetAiringTodayTvsEvent extends TvsEvent {}

// class GetUpcomingMoviesEvent extends MoviesEvent {}
//
// class GetPopularMoviesEvent extends MoviesEvent {}
//
// class GetTopRatedMoviesEvent extends MoviesEvent {}
//
// class GetMoviesDetailsEvent extends MoviesEvent {}
