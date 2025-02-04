part of './../../../core/helpers/export_manager/export_manager.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTvs();

  Future<List<TvModel>> getAiringTodayTvs();

  Future<List<TvModel>> getPopularTvs();

  Future<List<TvModel>> getTopRatedTvs();

  Future<TvsDetailsModel> getTvDetails(TvsDetailsParameters parameters);

  Future<List<TvsRecommendationModel>> getTvRecommendation(
      TvRecommendationParameters parameters);

  Future<List<TvsSimilarModel>> getTvSimilar(TvSimilarParameters parameters);
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

  @override
  Future<List<TvsRecommendationModel>> getTvRecommendation(
      TvRecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.tvRecommendationPath(parameters.tvID));
    if (response.statusCode == 200) {
      return List<TvsRecommendationModel>.from(
          (response.data["results"] as List).map(
        (e) => TvsRecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvsSimilarModel>> getTvSimilar(
      TvSimilarParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.tvSimilarPath(parameters.tvID));
    if (response.statusCode == 200) {
      return List<TvsSimilarModel>.from((response.data["results"] as List).map(
        (e) => TvsSimilarModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
