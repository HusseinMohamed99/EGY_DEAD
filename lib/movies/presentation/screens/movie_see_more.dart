part of './../../../core/helpers/export_manager/export_manager.dart';

class MovieSeeMoreScreen extends StatelessWidget {
  const MovieSeeMoreScreen({
    super.key,
    required this.movieItems,
  });

  final MovieSeeMoreModel movieItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, title: '${movieItems.title} Movies'),
      body: ExploreAllMoviesOrTvsPage(
        itemCount: movieItems.movies.length + (movieItems.fetchData ? 0 : 1),
        itemBuilder: (context, index) {
          if (index < movieItems.movies.length) {
            final movie = movieItems.movies[index];
            return BuildMovieCard(movie: movie);
          } else {
            movieItems.addEvent();
            return const LoadingIndicator();
          }
        },
        addEvent: movieItems.addEvent,
      ),
    );
  }
}
