part of './../../../core/helpers/export_manager/export_manager.dart';

class GetAllTopRatedMoviesUseCase extends GenericUseCase<List<Movies>, int> {
  final MovieDataRepository baseMovieRepository;

  GetAllTopRatedMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movies>>> call(int parameters) async {
    return await baseMovieRepository.getAllTopRatedMovies(parameters);
  }
}
