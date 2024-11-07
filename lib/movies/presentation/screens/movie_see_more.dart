part of './../../../core/helpers/export_manager/export_manager.dart';

class MovieSeeMoreScreen extends StatelessWidget {
  const MovieSeeMoreScreen({
    super.key,
    required this.movieList,
    required this.title,
    required this.addEvent,
    required this.showFetchError,
  });

  final List<Movies> movieList;
  final String title;
  final Function addEvent;
  final bool showFetchError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SeeMoreAllMovies(
        itemCount: movieList.length + (showFetchError ? 0 : 1),
        itemBuilder: (context, index) {
          if (index < movieList.length) {
            final movie = movieList[index];
            return _buildMovieCard(context, movie);
          } else {
            // Trigger addEvent to fetch more data when reaching the end of the list
            addEvent();
            return const LoadingIndicator();
          }
        },
        addEvent: () {
          addEvent();
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorManager.charCoolColor,
      elevation: 0,
      title: Text(
        "$title Movies".toUpperCase(),
        style: context.textTheme.labelMedium,
      ),
      centerTitle: true,
    );
  }
}

Widget _buildMovieCard(BuildContext context, Movies movie) {
  return Container(
    decoration: BoxDecoration(
      color: ColorManager.charCoolColor,
      borderRadius: BorderRadius.circular(10).r,
    ),
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    margin: EdgeInsets.symmetric(vertical: 10.h),
    child: InkWell(
      onTap: () => navigateToMovieDetails(context, movie.id),
      child: Row(
        children: [
          _buildMovieImage(movie),
          Space(height: 0, width: 10),
          Expanded(
            child: _buildMovieInfo(context, movie),
          ),
        ],
      ),
    ),
  );
}

Widget _buildMovieImage(Movies movie) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.0).r,
    child: CachedImage(
      boxFit: BoxFit.fitHeight,
      imageUrl: ApiConstance.imageURL(movie.backdropPath),
      width: 120.w,
      height: 140.h,
    ),
  );
}

Widget _buildMovieInfo(BuildContext context, Movies movie) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        movie.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: context.textTheme.titleMedium,
      ),
      Space(height: 5, width: 0),
      Row(
        children: [
          BuildReleaseDateChip(releaseDate: movie.releaseDate),
          Space(width: 16, height: 0),
          BuildRating(rating: movie.voteAverage),
        ],
      ),
      Space(height: 10, width: 0),
      Text(
        movie.overview,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.labelSmall,
      ),
    ],
  );
}
