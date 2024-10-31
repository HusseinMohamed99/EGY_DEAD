part of './../../../core/helpers/export_manager/export_manager.dart';

class GetMovieDetailsUseCase
    extends GenericUseCase<MovieDetails, MovieDetailsParameters> {
  final MovieDataRepository baseMovieRepository;

  GetMovieDetailsUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieID;

  const MovieDetailsParameters({required this.movieID});

  @override
  List<Object> get props => [movieID];
}
