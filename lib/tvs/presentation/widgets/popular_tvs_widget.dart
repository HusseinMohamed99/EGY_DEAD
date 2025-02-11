part of './../../../core/helpers/export_manager/export_manager.dart';

class PopularTvsWidget extends StatelessWidget {
  const PopularTvsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsBloc, TvsStates>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        if (state.popularState == RequestState.loading) {
          return BuildContentTv(
            tvModel: TvSeeMoreModel(
              title: AppString.popular,
              tvList: state.popularTvs,
            ),
          ).skeletonize();
        } else if (state.popularState == RequestState.loaded) {
          state.popularTvs.shuffle(Random());
          return BuildContentTv(
            tvModel: TvSeeMoreModel(
              title: AppString.popular,
              tvList: state.popularTvs,
            ),
          );
        } else {
          return BuildErrorMessage(errorMessage: state.popularMessage);
        }
      },
    );
  }
}
