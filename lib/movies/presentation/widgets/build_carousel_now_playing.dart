part of './../../../core/helpers/export_manager/export_manager.dart';

class NowPlayingCarousel extends StatelessWidget {
  const NowPlayingCarousel({super.key, required this.movies});
  final List<Movies> movies;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: 300.h,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {},
      ),
      items: movies.map((movie) => _buildCarouselItem(movie, context)).toList(),
    );
  }

  Widget _buildCarouselItem(Movies movie, BuildContext context) {
    return GestureDetector(
      key: const Key('openMovieMinimalDetail'),
      onTap: () => navigateToMovieDetails(context, movie.id),
      child: Stack(
        children: [
          _buildBackgroundImage(movie.backdropPath),
          _buildMovieDetailsOverlay(context, movie),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(String imageUrl) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.black,
            Colors.black,
            Colors.grey,
          ],
          stops: [0, 0.3, 0.5, 1],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: CachedImage(
        boxFit: BoxFit.fill,
        imageUrl: ApiConstance.imageURL(imageUrl),
        width: double.infinity,
        height: 560.h,
      ),
    );
  }

  Widget _buildMovieDetailsOverlay(BuildContext context, Movies movie) {
    return Column(
      children: [
        _buildPosterImage(movie.posterPath),
        const Spacer(),
        _buildMovieInfo(context, movie),
      ],
    );
  }

  Widget _buildPosterImage(String posterPath) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(left: 8.w, top: 40.h),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        width: 70.w,
        height: 60.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManager.whiteColor, ColorManager.primaryGreenColor],
          ),
          borderRadius: BorderRadius.circular(50).r,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50).r,
          child: CachedImage(
            boxFit: BoxFit.fill,
            imageUrl: ApiConstance.imageURL(posterPath),
            width: 60.w,
            height: 50.h,
          ),
        ),
      ),
    );
  }

  Widget _buildMovieInfo(BuildContext context, Movies movie) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildNowPlayingLabel(context),
          _buildMovieTitle(context, movie.title),
        ],
      ),
    );
  }

  Widget _buildNowPlayingLabel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.circle,
            color: ColorManager.primaryRedColor,
            size: 16.sp,
          ),
          Space(height: 0, width: 4),
          Text(
            AppString.nowPlaying.toUpperCase(),
            style: context.textTheme.bodySmall!.copyWith(
              color: ColorManager.whiteColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16).r,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
