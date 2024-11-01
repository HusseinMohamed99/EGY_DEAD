part of './../../../core/helpers/export_manager/export_manager.dart';

class SeeMoreScreen extends StatelessWidget {
  const SeeMoreScreen({super.key, required this.tvsList, required this.name});

  final List<Tvs> tvsList;
  final String name;

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData(context)[AppTheme.darkTheme]!.textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.greyDarkColor,
        elevation: 0,
        title: Text(
          "$name Tvs".toUpperCase(),
          style: textTheme.labelLarge,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 12).r,
        itemCount: tvsList.length,
        itemBuilder: (context, index) {
          final tv = tvsList[index];
          return Container(
            decoration: BoxDecoration(
              color: ColorManager.darkPrimary,
              borderRadius: BorderRadius.circular(10).r,
            ),
            padding: const EdgeInsets.all(10).r,
            margin: const EdgeInsets.symmetric(vertical: 10).r,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TvsDetailsScreen(
                        tvsID: tv.id,
                      );
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ).r,
                    child: CachedImage(
                      imageUrl: ApiConstance.imageURL(tv.backdropPath),
                      width: 120.w,
                      height: 140.h,
                    ),
                  ),
                  Space(height: 0, width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tv.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: textTheme.labelLarge,
                        ),
                        Space(height: 5.h, width: 0),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ).r,
                              decoration: BoxDecoration(
                                color: ColorManager.primaryRedColor,
                                borderRadius: BorderRadius.circular(4.0).r,
                              ),
                              child: Text(
                                tv.firstAirDate.split('-')[0],
                                style: textTheme.titleSmall,
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
                                  (tv.voteAverage).toStringAsFixed(1),
                                  style: textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Space(height: 10.h, width: 0),
                        Text(
                          tvsList[index].overview,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleMedium,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
