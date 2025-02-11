part of '../../../core/helpers/export_manager/export_manager.dart';

void navigateToSeeMore(
    {required BuildContext context, required MovieSeeMoreModel model}) {
  context.pushNamed(Routes.movieSeeMoreScreen, arguments: model);
}

class MovieSeeMoreModel {
  MovieSeeMoreModel({
    required this.movies,
    required this.title,
    required this.addEvent,
    required this.fetchData,
  });
  final List<Movies> movies;
  final String title;
  final VoidCallback addEvent;
  final bool fetchData;
}
