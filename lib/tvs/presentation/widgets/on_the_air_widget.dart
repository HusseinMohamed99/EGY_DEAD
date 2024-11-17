part of './../../../core/helpers/export_manager/export_manager.dart';

class OnTheAirWidget extends StatelessWidget {
  const OnTheAirWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsBloc, TvsStates>(
      buildWhen: (previous, current) =>
          previous.onTheAirState != current.onTheAirState,
      builder: (context, state) {
        if (state.onTheAirState == RequestState.loaded) {
          return OnTheAirCarousel(tvModel: state.onTheAirTvs);
        } else {
          return BuildSkeletonCarousel();
        }
      },
    );
  }
}
