part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildContentMovies extends StatelessWidget {
  const BuildContentMovies({
    super.key,
    required this.movieItems,
    required this.isLoading,
  });
  final MovieSeeMoreModel movieItems;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          title: movieItems.title,
          onTap: () {
            navigateToSeeMore(
              context: context,
              model: movieItems,
            );
          },
        ),
        ContentMoviesWidget(movies: movieItems.movies),
      ],
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
        return HorizontalMoviesListViewCard(movies: movies[index]);
      },
    );
  }
}
