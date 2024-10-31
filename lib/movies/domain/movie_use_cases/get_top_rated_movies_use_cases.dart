part of './../../../core/helpers/export_manager/export_manager.dart';

class GetTopRatedMoviesUseCase
    extends GenericUseCase<List<Movies>, NoParameters> {
  final MovieDataRepository baseMovieRepository;

  GetTopRatedMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
