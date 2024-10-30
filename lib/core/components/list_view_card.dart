part of './../helpers/export_manager/export_manager.dart';

class HorizontalListViewCard extends StatelessWidget {
  const HorizontalListViewCard({
    super.key,
    required this.movies,
  });

  final Movies movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0).r,
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
          log('Movie ID: ${movies.id}');
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)).r,
          child: CachedImage(
            boxFit: BoxFit.fitHeight,
            imageUrl: ApiConstance.imageURL(movies.backdropPath),
            width: 120.w,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
