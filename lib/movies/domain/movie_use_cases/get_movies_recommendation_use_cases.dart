part of './../../../core/helpers/export_manager/export_manager.dart';

class GetMovieRecommendationUseCase extends GenericUseCase<
    List<MoviesRecommendation>, MovieRecommendationParameters> {
  final MovieDataRepository baseMovieRepository;

  GetMovieRecommendationUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<MoviesRecommendation>>> call(
      MovieRecommendationParameters parameters) async {
    return await baseMovieRepository.getMovieRecommendation(parameters);
  }
}

class MovieRecommendationParameters extends Equatable {
  final int movieID;

  const MovieRecommendationParameters({required this.movieID});

  @override
  List<Object> get props => [movieID];
}
