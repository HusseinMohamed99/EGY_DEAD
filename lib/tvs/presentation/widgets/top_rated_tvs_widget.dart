part of './../../../core/helpers/export_manager/export_manager.dart';

class TopRatedTvsWidget extends StatelessWidget {
  const TopRatedTvsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsBloc, TvsStates>(
      buildWhen: (previous, current) =>
          previous.topRatedStates != current.topRatedStates,
      builder: (context, state) {
        if (state.topRatedStates == RequestState.loading) {
          return IsListLoading();
        } else if (state.topRatedStates == RequestState.loaded) {
          state.topRatedTvs.shuffle(Random());
          return BuildContentTv(
            fetchData: false,
            tvModel: state.topRatedTvs,
            title: AppString.topRated,
            isLoading: state.topRatedStates == RequestState.loading,
            addEvent: () {},
          );
        } else if (state.topRatedStates == RequestState.fetchData) {
          state.topRatedTvs.shuffle(Random());
          return BuildContentTv(
            fetchData: true,
            tvModel: state.topRatedTvs,
            title: AppString.topRated,
            isLoading: state.topRatedStates == RequestState.loading,
            addEvent: () {},
          );
        } else {
          return BuildErrorMessage(errorMessage: state.topRatedMessage);
        }
      },
    );
  }
}
