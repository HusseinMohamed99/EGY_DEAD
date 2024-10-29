import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/generic_use_case/generic_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetUpcomingMoviesUseCase
    extends GenericUseCase<List<Movies>, NoParameters> {
  final MovieDataRepository baseMovieRepository;

  GetUpcomingMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getUpcomingMovies();
  }
}
