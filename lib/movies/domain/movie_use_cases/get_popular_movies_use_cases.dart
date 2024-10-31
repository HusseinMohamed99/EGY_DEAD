part of './../../../core/helpers/export_manager/export_manager.dart';

class GetPopularMoviesUseCase
    extends GenericUseCase<List<Movies>, NoParameters> {
  final MovieDataRepository baseMovieRepository;

  GetPopularMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getPopularMovies();
  }
}
