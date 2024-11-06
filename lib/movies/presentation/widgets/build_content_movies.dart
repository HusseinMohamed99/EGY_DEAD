part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildContentMovies extends StatelessWidget {
  const BuildContentMovies({
    super.key,
    required this.movies,
    required this.title,
    required this.isLoading,
  });
  final List<Movies> movies;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildHeaderWidget(
          movies: movies,
          title: title,
        ),
        ContentMoviesWidget(movies: movies),
      ],
    ).skeletonize(
      enabled: isLoading,
    );
  }
}

class ContentMoviesWidget extends StatelessWidget {
  const ContentMoviesWidget({
    required this.movies,
    super.key,
  });

  final List<Movies> movies;

  @override
  Widget build(BuildContext context) {
    return HorizontalListView(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return HorizontalListViewCard(movies: movies[index]);
      },
    );
  }
}
