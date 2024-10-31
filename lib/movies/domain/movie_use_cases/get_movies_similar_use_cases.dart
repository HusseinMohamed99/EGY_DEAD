part of './../../../core/helpers/export_manager/export_manager.dart';

class GetMovieSimilarUseCase
    extends GenericUseCase<List<MoviesSimilar>, MovieSimilarParameters> {
  final MovieDataRepository baseMovieRepository;

  GetMovieSimilarUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<MoviesSimilar>>> call(
      MovieSimilarParameters parameters) async {
    return await baseMovieRepository.getMovieSimilar(parameters);
  }
}

class MovieSimilarParameters extends Equatable {
  final int movieID;

  const MovieSimilarParameters({required this.movieID});

  @override
  List<Object> get props => [movieID];
}
