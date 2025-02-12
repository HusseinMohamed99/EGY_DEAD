part of '../../../core/helpers/export_manager/export_manager.dart';

class TvsStates extends Equatable {
  const TvsStates({
    this.onTheAirTvs = const [],
    this.onTheAirState = RequestState.loading,
    this.onTheAirMessage = '',
    this.airingTodayTvs = const [],
    this.airingTodayState = RequestState.loading,
    this.airingTodayMessage = '',
    this.popularTvs = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedStates = RequestState.loading,
    this.topRatedTvs = const [],
    this.topRatedMessage = '',
  });
  final List<Tvs> onTheAirTvs;
  final RequestState onTheAirState;
  final String onTheAirMessage;

  final List<Tvs> airingTodayTvs;
  final RequestState airingTodayState;
  final String airingTodayMessage;

  final List<Tvs> popularTvs;
  final RequestState popularState;
  final String popularMessage;

  final List<Tvs> topRatedTvs;
  final RequestState topRatedStates;
  final String topRatedMessage;

  TvsStates copyWith({
    List<Tvs>? onTheAirTvs,
    RequestState? onTheAirState,
    String? onTheAirMessage,
    List<Tvs>? airingTodayTvs,
    RequestState? airingTodayState,
    String? airingTodayMessage,
    List<Tvs>? popularTvs,
    RequestState? popularState,
    String? popularMessage,
    List<Tvs>? topRatedTvs,
    RequestState? topRatedStates,
    String? topRatedMessage,
  }) {
    return TvsStates(
      onTheAirTvs: onTheAirTvs ?? this.onTheAirTvs,
      onTheAirState: onTheAirState ?? this.onTheAirState,
      onTheAirMessage: onTheAirMessage ?? this.onTheAirMessage,
      airingTodayTvs: airingTodayTvs ?? this.airingTodayTvs,
      airingTodayState: airingTodayState ?? this.airingTodayState,
      airingTodayMessage: airingTodayMessage ?? this.airingTodayMessage,
      popularMessage: popularMessage ?? this.popularMessage,
      popularTvs: popularTvs ?? this.popularTvs,
      popularState: popularState ?? this.popularState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedTvs: topRatedTvs ?? this.topRatedTvs,
      topRatedStates: topRatedStates ?? this.topRatedStates,
    );
  }

  @override
  List<Object?> get props => [
        onTheAirTvs,
        onTheAirState,
        onTheAirMessage,
        airingTodayTvs,
        airingTodayState,
        airingTodayMessage,
        popularMessage,
        popularState,
        popularTvs,
        topRatedStates,
        topRatedTvs,
        topRatedMessage,
      ];
}
