import 'dart:async';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_recommendation_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_similar_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_events.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/tvs/domain/usecases/get_tv_details_usecases.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_details_events.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_details_states.dart';

class TvsDetailsBloc extends Bloc<TvsDetailsEvent, TvsDetailsStates> {
  final GetTvsDetailsUseCase getTvsDetailsUseCase;

  // final GetTvsRecommendationUseCase getTvsRecommendationsUseCase;
  // final GetTvsSimilarUseCase getTvsSimilarUseCase;

  TvsDetailsBloc(this.getTvsDetailsUseCase) : super(const TvsDetailsStates()) {
    on<GetTvsDetailsEvent>(_getTvsDetails);
    // on<GetTvsRecommendationEvent>(_getTvsRecommendations);
    // on<GetTvsSimilarEvent>(_getTvsSimilar);
  }

  FutureOr<void> _getTvsDetails(
      GetTvsDetailsEvent event, Emitter<TvsDetailsStates> emit) async {
    final result =
        await getTvsDetailsUseCase(TvsDetailsParameters(tvsID: event.movieID));
    result.fold(
        (l) => emit(state.copyWith(
            tvsDetailsStates: RequestState.error,
            tvsDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            tvsDetailsStates: RequestState.loaded, tvsDetails: r)));
  }

// FutureOr<void> _getTvsRecommendations(GetTvsRecommendationEvent event,
//     Emitter<TvsDetailsStates> emit) async {
//   final result = await getTvsRecommendationsUseCase(
//       TvsRecommendationParameters(movieID: event.id));
//   result.fold(
//       (l) => emit(state.copyWith(
//             moviesRecommendationStates: RequestState.error,
//             moviesRecommendationMessage: l.message,
//           )),
//       (r) => emit(state.copyWith(
//             moviesRecommendationStates: RequestState.loaded,
//             moviesRecommendation: r,
//           )));
// }
//
// FutureOr<void> _getTvsSimilar(
//     GetTvsSimilarEvent event, Emitter<TvsDetailsStates> emit) async {
//   final result =
//       await getTvsSimilarUseCase(TvsSimilarParameters(movieID: event.id));
//   result.fold(
//       (l) => emit(state.copyWith(
//             moviesSimilarStates: RequestState.error,
//             moviesSimilarMessage: l.message,
//           )),
//       (r) => emit(state.copyWith(
//             moviesSimilarStates: RequestState.loaded,
//             moviesSimilar: r,
//           )));
// }
}
