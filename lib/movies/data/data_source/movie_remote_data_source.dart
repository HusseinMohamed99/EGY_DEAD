part of './../../../core/helpers/export_manager/export_manager.dart';

abstract class RemoteMovieDataSource {
  Future<List<MovieModel>> getAllPopularMovies(int page);

  Future<List<MovieModel>> getAllTopRatedMovies(int page);
  Future<List<MovieModel>> getAllUpcomingMovies(int page);

  Future<List<List<MovieModel>>> getMovies();

  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getUpcomingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<MoviesRecommendationModel>> getMovieRecommendation(
      MovieRecommendationParameters parameters);

  Future<List<MoviesSimilarModel>> getMovieSimilar(
      MovieSimilarParameters parameters);
}

class MovieRemoteDataSource extends RemoteMovieDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await Dio().get(ApiConstance.upcomingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.movieID));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesRecommendationModel>> getMovieRecommendation(
      MovieRecommendationParameters parameters) async {
    final response = await Dio()
        .get(ApiConstance.movieRecommendationPath(parameters.movieID));
    if (response.statusCode == 200) {
      return List<MoviesRecommendationModel>.from(
          (response.data["results"] as List).map(
        (e) => MoviesRecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesSimilarModel>> getMovieSimilar(
      MovieSimilarParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieSimilarPath(parameters.movieID));
    if (response.statusCode == 200) {
      return List<MoviesSimilarModel>.from(
          (response.data["results"] as List).map(
        (e) => MoviesSimilarModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<List<MovieModel>>> getMovies() async {
    final response = Future.wait(
      [
        getNowPlayingMovies(),
        getPopularMovies(),
        getTopRatedMovies(),
      ],
      eagerError: true,
    );
    return response;
  }

  @override
  Future<List<MovieModel>> getAllPopularMovies(int page) async {
    final response =
        await Dio().get(ApiConstance.getAllPopularMoviesPath(page));
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getAllTopRatedMovies(int page) async {
    final response =
        await Dio().get(ApiConstance.getAllTopRatedMoviesPath(page));
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getAllUpcomingMovies(int page) async {
    final response =
        await Dio().get(ApiConstance.getAllUpcomingMoviesPath(page));
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
