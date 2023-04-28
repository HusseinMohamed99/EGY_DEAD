import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/tvs/data/model/tvs_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTvs();

  Future<List<TvModel>> getAiringTodayTvs();

// Future<List<MovieModel>> getUpcomingMovies();
//
// Future<List<MovieModel>> getPopularMovies();
//
// Future<List<MovieModel>> getTopRatedMovies();
//
// Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
//
// Future<List<MoviesRecommendationModel>> getMovieRecommendation(
//     MovieRecommendationParameters parameters);
//
// Future<List<MoviesSimilarModel>> getMovieSimilar(
//     MovieSimilarParameters parameters);
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> getOnTheAirTvs() async {
    final response = await Dio().get(ApiConstance.onTheAirTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data["results"] as List).map(
        (e) => TvModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getAiringTodayTvs() async {
    final response = await Dio().get(ApiConstance.airingTodayTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data["results"] as List).map(
        (e) => TvModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

// @override
// Future<List<MovieModel>> getUpcomingMovies() async {
//   final response = await Dio().get(ApiConstance.upcomingMoviesPath);
//   if (response.statusCode == 200) {
//     return List<MovieModel>.from((response.data["results"] as List).map(
//       (e) => MovieModel.fromJson(e),
//     ));
//   } else {
//     throw ServerException(
//       errorMessageModel: ErrorMessageModel.fromJson(response.data),
//     );
//   }
// }
//
// @override
// Future<List<MovieModel>> getPopularMovies() async {
//   final response = await Dio().get(ApiConstance.popularMoviesPath);
//   if (response.statusCode == 200) {
//     return List<MovieModel>.from((response.data["results"] as List).map(
//       (e) => MovieModel.fromJson(e),
//     ));
//   } else {
//     throw ServerException(
//       errorMessageModel: ErrorMessageModel.fromJson(response.data),
//     );
//   }
// }
//
// @override
// Future<List<MovieModel>> getTopRatedMovies() async {
//   final response = await Dio().get(ApiConstance.topRatedMoviesPath);
//   if (response.statusCode == 200) {
//     return List<MovieModel>.from((response.data["results"] as List).map(
//       (e) => MovieModel.fromJson(e),
//     ));
//   } else {
//     throw ServerException(
//       errorMessageModel: ErrorMessageModel.fromJson(response.data),
//     );
//   }
// }
//
// @override
// Future<MovieDetailsModel> getMovieDetails(
//     MovieDetailsParameters parameters) async {
//   final response =
//       await Dio().get(ApiConstance.movieDetailsPath(parameters.movieID));
//   if (response.statusCode == 200) {
//     return MovieDetailsModel.fromJson(response.data);
//   } else {
//     throw ServerException(
//       errorMessageModel: ErrorMessageModel.fromJson(response.data),
//     );
//   }
// }
//
// @override
// Future<List<MoviesRecommendationModel>> getMovieRecommendation(
//     MovieRecommendationParameters parameters) async {
//   final response = await Dio()
//       .get(ApiConstance.movieRecommendationPath(parameters.movieID));
//   if (response.statusCode == 200) {
//     return List<MoviesRecommendationModel>.from(
//         (response.data["results"] as List).map(
//       (e) => MoviesRecommendationModel.fromJson(e),
//     ));
//   } else {
//     throw ServerException(
//       errorMessageModel: ErrorMessageModel.fromJson(response.data),
//     );
//   }
// }
//
// @override
// Future<List<MoviesSimilarModel>> getMovieSimilar(
//     MovieSimilarParameters parameters) async {
//   final response =
//       await Dio().get(ApiConstance.movieSimilarPath(parameters.movieID));
//   if (response.statusCode == 200) {
//     return List<MoviesSimilarModel>.from(
//         (response.data["results"] as List).map(
//       (e) => MoviesSimilarModel.fromJson(e),
//     ));
//   } else {
//     throw ServerException(
//       errorMessageModel: ErrorMessageModel.fromJson(response.data),
//     );
//   }
// }
}
