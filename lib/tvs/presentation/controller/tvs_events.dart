part of './../../../core/helpers/export_manager/export_manager.dart';

abstract class TvsEvent extends Equatable {
  const TvsEvent();

  @override
  List<Object?> get props => [];
}

class GetOnTheAirTvsEvent extends TvsEvent {}

class GetAiringTodayTvsEvent extends TvsEvent {}

class GetPopularTvsEvent extends TvsEvent {}

class GetTopRatedTvsEvent extends TvsEvent {}

class GetTvDetailsEvent extends TvsEvent {}
