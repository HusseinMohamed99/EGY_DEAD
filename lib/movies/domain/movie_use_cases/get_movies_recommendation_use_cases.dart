import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/generic_use_case/generic_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

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
