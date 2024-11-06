part of './../../../core/helpers/export_manager/export_manager.dart';

class TopRatedTvsWidget extends StatelessWidget {
  const TopRatedTvsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;
    return BlocBuilder<TvsBloc, TvsStates>(
      buildWhen: (previous, current) =>
          previous.topRatedStates != current.topRatedStates,
      builder: (context, state) {
        switch (state.topRatedStates) {
          case RequestState.loading:
            return SizedBox(
              height: 130.h,
              child: const LoadingIndicator(),
            );
          case RequestState.loaded:
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ).r,
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
                                return SeeMoreScreen(
                                  tvsList: state.topRatedTvs,
                                  name: AppString.topRated,
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
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16).r,
                      itemCount: state.topRatedTvs.length,
                      itemBuilder: (context, index) {
                        final tvs = state.topRatedTvs[index];
                        return Container(
                          padding: const EdgeInsets.only(right: 8.0).r,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TvsDetailsScreen(
                                    tvsID: tvs.id,
                                  ),
                                ),
                              );
                              if (kDebugMode) {
                                print(tvs.id);
                              }
                            },
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))
                                      .r,
                              child: CachedImage(
                                imageUrl:
                                    ApiConstance.imageURL(tvs.backdropPath),
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
              height: 300.h,
              child: Center(
                child: Text(
                  state.topRatedMessage,
                  style: textTheme.labelLarge,
                ),
              ),
            );
          case RequestState.fetchMoreError:
            return SizedBox(
              height: 300.h,
              child: Center(
                child: Text(
                  'loading',
                  style: textTheme.titleLarge,
                ),
              ),
            );
        }
      },
    );
  }
}
