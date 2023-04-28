import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/tvs/data/model/tvs_details_model.dart';
import 'package:movies_app/tvs/data/model/tvs_model.dart';
import 'package:movies_app/tvs/domain/usecases/get_tv_details_usecases.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTvs();

  Future<List<TvModel>> getAiringTodayTvs();

  Future<List<TvModel>> getPopularTvs();

  Future<List<TvModel>> getTopRatedTvs();

  Future<TvsDetailsModel> getTvDetails(TvsDetailsParameters parameters);

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

  @override
  Future<List<TvModel>> getPopularTvs() async {
    final response = await Dio().get(ApiConstance.popularTvsPath);
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
  Future<List<TvModel>> getTopRatedTvs() async {
    final response = await Dio().get(ApiConstance.topRatedTvsPath);
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
  Future<TvsDetailsModel> getTvDetails(TvsDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.tvDetailsPath(parameters.tvsID));
    if (response.statusCode == 200) {
      return TvsDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

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
