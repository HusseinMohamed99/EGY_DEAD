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
          return IsListLoading();
        } else if (state.popularState == RequestState.loaded) {
          state.popularTvs.shuffle(Random());
          return BuildContentTv(
            fetchData: false,
            tvModel: state.popularTvs,
            title: AppString.popular,
            isLoading: state.popularState == RequestState.loading,
            addEvent: () {},
          );
        } else if (state.popularState == RequestState.fetchData) {
          state.popularTvs.shuffle(Random());
          return BuildContentTv(
            fetchData: true,
            tvModel: state.popularTvs,
            title: AppString.popular,
            isLoading: state.popularState == RequestState.loading,
            addEvent: () {},
          );
        } else {
          return BuildErrorMessage(errorMessage: state.popularMessage);
        }
      },
    );
  }
}
