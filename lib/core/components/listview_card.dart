import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalListViewCard extends StatelessWidget {
  const HorizontalListViewCard({
    super.key,
    required this.movies,
  });

  final Movies movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieID: movies.id,
              ),
            ),
          );
          if (kDebugMode) {
            print(movies.id);
          }
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            height: double.infinity,
            width: 120.0,
            fit: BoxFit.cover,
            imageUrl: ApiConstance.imageURL(movies.backdropPath),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
