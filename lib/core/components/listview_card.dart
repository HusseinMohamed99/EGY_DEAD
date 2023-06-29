import 'package:flutter/material.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';

class VerticalListViewCard extends StatelessWidget {
  const VerticalListViewCard({
    super.key,
    required this.movies,
  });

  final Movies movies;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (BuildContext context) {
        //       return SeeMoreScreen(
        //         movieList: state.popularMovies,
        //         title: AppString.popular,
        //       );
        //     },
        //   ),
        // );
      },
      child: Container(
        height: 175,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageWithShimmer(
                  imageUrl: movies.posterPath,
                  width: 110,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      movies.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleSmall,
                    ),
                  ),
                  Row(
                    children: [
                      if (movies.releaseDate.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            movies.releaseDate.split(', ')[1],
                            textAlign: TextAlign.center,
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      ],
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Text(
                        movies.voteAverage.toString(),
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Text(
                      movies.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
