part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildContentPopularMovies extends StatelessWidget {
  const BuildContentPopularMovies({
    super.key,
    required this.state,
  });
  final MoviesStates state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context, state),
        PopularWidget(movies: state.popularMovies),
      ],
    ).skeletonize(enabled: state.popularState == RequestState.loading);
  }

  Widget _buildHeader(BuildContext context, MoviesStates state) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppString.popular,
            style: context.textTheme.titleSmall,
          ),
          InkWell(
            onTap: () => _navigateToSeeMore(context, state.popularMovies),
            child: Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: Row(
                children: [
                  Text(
                    AppString.seeMore,
                    style: context.textTheme.labelSmall,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.sp,
                    color: ColorManager.whiteColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToSeeMore(BuildContext context, List<Movies> popularMovies) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieSeeMoreScreen(
          movieList: popularMovies,
          title: AppString.popular,
        ),
      ),
    );
  }
}

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    required this.movies,
    this.showFetchError = false,
    super.key,
  });

  final List<Movies> movies;
  final bool showFetchError;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        return HorizontalListView(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return HorizontalListViewCard(movies: movies[index]);
          },
        );
      },
    );
  }
}
