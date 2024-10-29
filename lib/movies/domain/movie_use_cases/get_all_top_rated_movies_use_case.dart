import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/generic_use_case/generic_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetAllTopRatedMoviesUseCase extends GenericUseCase<List<Movies>, int> {
  final MovieDataRepository baseMovieRepository;

  GetAllTopRatedMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movies>>> call(int parameters) async {
    return await baseMovieRepository.getAllTopRatedMovies(parameters);
  }
}
