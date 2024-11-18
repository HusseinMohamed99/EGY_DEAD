part of './../../../core/helpers/export_manager/export_manager.dart';

class LoadingTvsDetailsContent extends StatelessWidget {
  const LoadingTvsDetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SingleChildScrollView(
        key: const Key('tvDetailScrollView'),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CachedImage(
                  imageUrl: ApiConstance.imageURL(''),
                  width: double.infinity,
                  height: 250.h,
                  boxFit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0).r,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10).r,
                              border: Border.all(
                                color: ColorManager.whiteColor,
                              ),
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16).r,
                                  child: CachedImage(
                                    imageUrl: ApiConstance.imageURL(
                                      '',
                                    ),
                                    width: 120.w,
                                    height: 150.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Space(height: 0, width: 16.w),
                          Expanded(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 19.r,
                                  backgroundColor: ColorManager.primaryRedColor,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.play_circle,
                                      color: ColorManager.whiteColor,
                                    ),
                                  ),
                                ),
                                Space(height: 10, width: 0),
                                Text(
                                  'Series Name',
                                  style: context.textTheme.titleLarge,
                                ),
                                Space(height: 8.h, width: 0),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.h,
                                        horizontal: 8.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorManager.greyDarkColor,
                                        borderRadius:
                                            BorderRadius.circular(4.0).r,
                                      ),
                                      child: Text(
                                        '2021',
                                        style: context.textTheme.labelMedium,
                                      ),
                                    ),
                                    Space(height: 0, width: 16.w),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: ColorManager.iconRateColor,
                                          size: 20.sp,
                                        ),
                                        Space(height: 0, width: 4.w),
                                        Text(
                                          '9.0',
                                          style: context.textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                    Space(height: 0, width: 16.w),
                                    Expanded(
                                      child: Text(
                                        _showDuration(
                                          120,
                                        ),
                                        style: context.textTheme.labelMedium!
                                            .copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Overview',
                              style: context.textTheme.titleMedium,
                            ),
                            Space(height: 8.h, width: 0),
                            Text(
                              'Genres: ${_showGenres([
                                    Genres(
                                      id: 1,
                                      name: 'Action',
                                    ),
                                    Genres(
                                      id: 2,
                                      name: 'Adventure',
                                    ),
                                  ])}',
                              style: context.textTheme.labelSmall!.copyWith(
                                color: ColorManager.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Space(height: 5, width: 0),
                TabBar(
                  labelPadding: EdgeInsets.zero,
                  labelColor: ColorManager.whiteColor,
                  unselectedLabelColor: ColorManager.greyColor,
                  indicatorColor: ColorManager.primaryRedColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    TapsWidget(title: AppString.seasons),
                    TapsWidget(title: AppString.recommendations),
                    TapsWidget(title: AppString.moreLikeThis),
                  ],
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 500.h,
                  child: TabBarView(
                    children: [
                      ShowSeasonSeries(),
                      ShowRecommendationSeries(),
                      ShowSimilarSeries(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ).skeletonize(enabled: true);
  }
}
