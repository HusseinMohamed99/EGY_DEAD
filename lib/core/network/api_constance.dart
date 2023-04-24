class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String appKey = "3749b74bf1ddcbe533ad60dc2b7833b0";

  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$appKey";

  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$appKey";

  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$appKey";

  static const String baseImageURL = "https://image.tmdb.org/t/p/w500";

  static String imageURL(String imagePath) => '$baseImageURL$imagePath';
}
