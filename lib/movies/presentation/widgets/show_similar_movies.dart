part of './../../../core/helpers/export_manager/export_manager.dart';

class ShowSimilarMovies extends StatelessWidget {
  const ShowSimilarMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
      builder: (context, state) {
        if (state.moviesSimilarStates == RequestState.loading) {
          return SizedBox(
            height: 300.h,
            child: const LoadingIndicator(),
          );
        }

        if (state.moviesSimilarStates == RequestState.loaded) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.moviesSimilar.length,
                itemBuilder: (context, index) {
                  final similar = state.moviesSimilar[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8).r,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                              movieID: similar.id,
                            ),
                          ),
                        );
                        if (kDebugMode) {
                          print(similar.id);
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
                            imageUrl:
                                ApiConstance.imageURL(similar.backdropPath!),
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
        }

        // Display error or fetch data messages
        final message = state.moviesSimilarStates == RequestState.error
            ? state.moviesSimilarMessage
            : state.moviesDetailsMessage;

        return SizedBox(
          height: 300.h,
          child: NoDataFoundWidget(
            message: message,
            imagePath: Assets.imagesNoData,
          ),
        );
      },
    );
  }
}
