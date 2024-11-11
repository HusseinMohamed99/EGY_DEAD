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
        switch (state.moviesRecommendationStates) {
          case RequestState.loading:
            return SizedBox(height: 300.h, child: const LoadingIndicator());
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.moviesRecommendation.length,
                  itemBuilder: (context, index) {
                    final recommendation = state.moviesRecommendation[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8).r,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                movieID: recommendation.id,
                              ),
                            ),
                          );
                          if (kDebugMode) {
                            print(recommendation.id);
                          }
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
                                  recommendation.backdropPath!),
                              width: 120.w,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 300.h,
              child: Center(
                child: Text(
                  state.moviesRecommendationMessage,
                  style: context.textTheme.titleLarge,
                ),
              ),
            );
          case RequestState.fetchData:
            return SizedBox(
              height: 300.h,
              child: Center(
                child: Text(
                  state.moviesDetailsMessage,
                  style: context.textTheme.titleLarge,
                ),
              ),
            );
        }
      },
    );
  }
}
