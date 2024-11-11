part of './../../../core/helpers/export_manager/export_manager.dart';

class ShowRecommendations extends StatelessWidget {
  const ShowRecommendations({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.recommendations,
          style: context.textTheme.titleMedium,
        ),
        Space(height: 8, width: 0),
        MovieRecommendationsDisplay(),
      ],
    );
  }
}

class MovieRecommendationsDisplay extends StatelessWidget {
  const MovieRecommendationsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
      builder: (context, state) {
        if (state.moviesRecommendationStates == RequestState.loading) {
          return SizedBox(height: 300.h, child: const LoadingIndicator());
        }

        if (state.moviesRecommendationStates == RequestState.loaded) {
          return MoviesRecommendationWidget(
            moviesDetailsStates: state,
          );
        } else {
          return NoDataFoundWidget(
            message: state.moviesRecommendationMessage,
            imagePath: Assets.imagesNoData,
          );
        }
      },
    );
  }
}

class MoviesRecommendationWidget extends StatelessWidget {
  const MoviesRecommendationWidget({
    super.key,
    required this.moviesDetailsStates,
  });

  final MoviesDetailsStates moviesDetailsStates;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: moviesDetailsStates.moviesRecommendation.length,
        itemBuilder: (context, index) {
          final recommendation =
              moviesDetailsStates.moviesRecommendation[index];
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsScreen(
                      movieID: recommendation.id,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  border: Border.all(
                    color: ColorManager.whiteColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ).r,
                  child: CachedImage(
                    imageUrl: ApiConstance.imageURL(
                      recommendation.backdropPath ?? '',
                    ),
                    width: 120.w,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
