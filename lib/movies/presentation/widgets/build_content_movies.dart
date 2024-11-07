part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildContentMovies extends StatelessWidget {
  const BuildContentMovies({
    super.key,
    required this.movies,
    required this.title,
    required this.isLoading,
    required this.addEvent,
    required this.fetchData,
  });
  final List<Movies> movies;
  final String title;
  final bool isLoading;
  final Function addEvent;
  final bool fetchData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildHeaderWidget(
          fetchData: fetchData,
          movies: movies,
          title: title,
          addEvent: addEvent,
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
