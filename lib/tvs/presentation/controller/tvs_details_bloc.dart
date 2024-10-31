part of './../../../core/helpers/export_manager/export_manager.dart';

class TvsDetailsBloc extends Bloc<TvsDetailsEvent, TvsDetailsStates> {
  final GetTvsDetailsUseCase getTvsDetailsUseCase;

  final GetTvRecommendationUseCase getTvsRecommendationsUseCase;
  final GetTvSimilarUseCase getTvsSimilarUseCase;

  TvsDetailsBloc(this.getTvsDetailsUseCase, this.getTvsRecommendationsUseCase,
      this.getTvsSimilarUseCase)
      : super(const TvsDetailsStates()) {
    on<GetTvsDetailsEvent>(_getTvsDetails);
    on<GetTvsRecommendationEvent>(_getTvsRecommendations);
    on<GetTvsSimilarEvent>(_getTvsSimilar);
  }

  FutureOr<void> _getTvsDetails(
      GetTvsDetailsEvent event, Emitter<TvsDetailsStates> emit) async {
    final result =
        await getTvsDetailsUseCase(TvsDetailsParameters(tvsID: event.tvID));
    result.fold(
        (l) => emit(state.copyWith(
            tvsDetailsStates: RequestState.error,
            tvsDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            tvsDetailsStates: RequestState.loaded, tvsDetails: r)));
    return null;
  }

  FutureOr<void> _getTvsRecommendations(
      GetTvsRecommendationEvent event, Emitter<TvsDetailsStates> emit) async {
    final result = await getTvsRecommendationsUseCase(
        TvRecommendationParameters(tvID: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              tvsRecommendationStates: RequestState.error,
              tvsRecommendationMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              tvsRecommendationStates: RequestState.loaded,
              tvsRecommendation: r,
            )));
    return null;
  }

  FutureOr<void> _getTvsSimilar(
      GetTvsSimilarEvent event, Emitter<TvsDetailsStates> emit) async {
    final result =
        await getTvsSimilarUseCase(TvSimilarParameters(tvID: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              tvsSimilarStates: RequestState.error,
              tvsSimilarMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              tvsSimilarStates: RequestState.loaded,
              tvsSimilar: r,
            )));
    return null;
  }
}
