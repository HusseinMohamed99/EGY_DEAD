part of './../../../core/helpers/export_manager/export_manager.dart';

class SeriesLoadedItem extends StatelessWidget {
  const SeriesLoadedItem({
    super.key,
    required this.imageUrl,
    required this.name,
    this.episodeCount,
    this.onTap,
  });

  final String imageUrl, name;
  final String? episodeCount;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: buildContainerDecoration(radius: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ).r,
                  border: Border.all(
                    color: ColorManager.whiteColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                  ).r,
                  child: CachedImage(
                    imageUrl: ApiConstance.imageURL(imageUrl),
                    width: 90.w,
                    height: 90.h,
                    boxFit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    SeriesInfo(seasonName: name),
                    if (episodeCount != null)
                      SeriesInfo(seasonName: '$episodeCount Episodes'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeriesInfo extends StatelessWidget {
  const SeriesInfo({
    super.key,
    required this.seasonName,
  });
  final String seasonName;

  @override
  Widget build(BuildContext context) {
    return Text(
      seasonName,
      style: TextStyleManager.labelMedium(context: context),
    );
  }
}
