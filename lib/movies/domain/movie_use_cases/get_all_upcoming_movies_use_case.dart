part of './../../../core/helpers/export_manager/export_manager.dart';

class GetAllUpcomingMoviesUseCase extends GenericUseCase<List<Movies>, int> {
  final MovieDataRepository baseMovieRepository;

  GetAllUpcomingMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movies>>> call(int parameters) async {
    return await baseMovieRepository.getAllUpcomingMovies(parameters);
  }
}
