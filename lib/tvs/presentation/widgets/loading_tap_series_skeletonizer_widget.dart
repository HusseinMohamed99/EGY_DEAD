part of './../../../core/helpers/export_manager/export_manager.dart';

class LoadingTapSeriesSkeletonWidget extends StatelessWidget {
  const LoadingTapSeriesSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            border: Border.all(
              color: ColorManager.whiteColor,
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)).r,
            child: CachedImage(
              imageUrl: ApiConstance.imageURL(''),
              width: 100.w,
              height: 100.h,
              boxFit: BoxFit.fill,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Space(height: 20.h, width: 0),
    ).skeletonize(
      enabled: true,
    );
  }
}
