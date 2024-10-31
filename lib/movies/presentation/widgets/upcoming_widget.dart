part of './../../../core/helpers/export_manager/export_manager.dart';

class UpcomingWidget extends StatelessWidget {
  const UpcomingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;

    return BlocBuilder<MoviesBloc, MoviesStates>(
       bloc:context.read<MoviesBloc>()
        ..add(GetUpcomingMoviesEvent()) ,
      buildWhen: (previous, current) =>
          previous.upcomingState != current.upcomingState,
      builder: (context, state) {
        switch (state.upcomingState) {
          case RequestState.loading:
            return SizedBox(
              height: 130.h,
              child: const LoadingIndicator(),
            );
          case RequestState.loaded:
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.upcoming,
                        style: textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return MovieSeeMoreScreen(
                                  movieList: state.upcomingMovies,
                                  title: AppString.upcoming,
                                );
                              },
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: Row(
                            children: [
                              Text(
                                AppString.seeMore,
                                style: textTheme.labelSmall,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.sp,
                                color: ColorManager.whiteColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    height: 130.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
                      itemCount: state.upcomingMovies.length,
                      itemBuilder: (context, index) {
                        final movie = state.upcomingMovies[index];
                        return Container(
                          padding: const EdgeInsets.only(right: 16.0).r,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailsScreen(
                                    movieID: movie.id,
                                  ),
                                ),
                              );
                              if (kDebugMode) {
                                print(movie.id);
                              }
                            },
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))
                                      .r,
                              child: CachedImage(
                                boxFit: BoxFit.fitHeight,
                                imageUrl:
                                    ApiConstance.imageURL(movie.backdropPath),
                                width: 120.w,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          case RequestState.error:
            return SizedBox(
              height: 400.h,
              child: Center(
                child: Text(
                  state.nowPlayingMessage,
                  style: textTheme.labelLarge,
                ),
              ),
            );
        }
      },
    );
  }
}
