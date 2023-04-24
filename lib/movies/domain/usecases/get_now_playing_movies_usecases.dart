import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<Movies>, NoParameter> {
  final BaseMovieRepository baseMovieRepository;
  GetNowPlayingMoviesUseCase({required this.baseMovieRepository});

  // call -->        calling with constructor
  @override
  Future<Either<Failure, List<Movies>>> call(NoParameter parameter) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
