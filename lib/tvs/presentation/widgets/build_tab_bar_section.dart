part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildTabBarSection extends StatelessWidget {
  const BuildTabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
