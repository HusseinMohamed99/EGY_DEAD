part of './../../../core/helpers/export_manager/export_manager.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieID;

  const MovieDetailsScreen({super.key, required this.movieID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesDetailsBloc>()
        ..add(GetMoviesDetailsEvent(movieID))
        ..add(GetMoviesRecommendationEvent(movieID))
        ..add(GetMoviesSimilarEvent(movieID)),
      child: const Scaffold(
        body: MovieDescriptionPanel(),
      ),
    );
  }
}
