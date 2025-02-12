part of '../../../core/helpers/export_manager/export_manager.dart';

abstract class TvsDetailsEvent extends Equatable {
  const TvsDetailsEvent();
}

class GetTvsDetailsEvent extends TvsDetailsEvent {
  const GetTvsDetailsEvent(this.tvID);
  final int tvID;

  @override
  List<Object?> get props => [tvID];
}

class GetTvsRecommendationEvent extends TvsDetailsEvent {
  const GetTvsRecommendationEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}

class GetTvsSimilarEvent extends TvsDetailsEvent {
  const GetTvsSimilarEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
