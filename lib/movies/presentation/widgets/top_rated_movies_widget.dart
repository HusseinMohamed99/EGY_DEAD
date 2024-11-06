part of './../../../core/helpers/export_manager/export_manager.dart';

class TopRatedMoviesWidget extends StatelessWidget {
  const TopRatedMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;
    return BlocBuilder<MoviesBloc, MoviesStates>(
//  bloc:context.read<MoviesBloc>()
//       ..add(GetPopularMoviesEvent()),
      buildWhen: (previous, current) =>
          previous.topRatedStates != current.topRatedStates,
      builder: (context, state) {
        switch (state.topRatedStates) {
          case GetAllRequestStatus.loading:
            return SizedBox(
              height: 130.h,
              child: const LoadingIndicator(),
            );
          case GetAllRequestStatus.loaded:
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.topRated,
                        style: textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return MovieSeeMoreScreen(
                                  movieList: state.topRatedMovies,
                                  title: AppString.topRated,
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
                TopRatedWidget(movies: state.topRatedMovies),
              ],
            );
          case GetAllRequestStatus.error:
            return SizedBox(
              height: 300.h,
              child: Center(
                child: Text(
                  state.topRatedMessage,
                  style: textTheme.labelLarge,
                ),
              ),
            );
          case GetAllRequestStatus.fetchMoreError:
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.topRated,
                        style: textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return MovieSeeMoreScreen(
                                  movieList: state.topRatedMovies,
                                  title: AppString.topRated,
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
                TopRatedWidget(movies: state.topRatedMovies),
              ],
            );
        }
      },
    );
  }
}

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({
    required this.movies,
    super.key,
  });

  final List<Movies> movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      builder: (context, state) {
        return HorizontalListView(
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            if (index < movies.length) {
              return HorizontalListViewCard(movies: movies[index]);
            } else {
              return const LoadingIndicator();
            }
          },
        );
      },
    );
  }
}
