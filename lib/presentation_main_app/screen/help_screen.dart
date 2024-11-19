part of './../../core/helpers/export_manager/export_manager.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.darkPrimary,
        elevation: 0,
        title: Text(
          AppString.contactSupport,
          style: context.textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 20, bottom: 20).r,
              child: CircleAvatar(
                maxRadius: 93.r,
                minRadius: 93.r,
                backgroundColor: ColorManager.primaryGreenColor,
                child: CircleAvatar(
                  maxRadius: 90.r,
                  minRadius: 90.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(95).r,
                    child: Image.asset(
                      Assets.imagesLogo,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 200.h,
                    ),
                  ),
                ),
              ),
            ),
            CardItem(
              title: 'Mail',
              url: 'mailto:hussein.mohmed1907@gmail.com',
              imageSvg: Assets.imagesGoogle,
            ),
            Space(height: 10, width: 0),
            CardItem(
              title: 'GitHub',
              url: 'https://github.com/HusseinMohamed99',
              imageSvg: Assets.imagesGithub,
            ),
            Space(height: 10, width: 0),
            CardItem(
              title: 'LinkedIn',
              url: 'https://www.linkedin.com/in/hussein99',
              imageSvg: Assets.imagesLinkedin,
            ),
            Space(height: 10, width: 0),
            CardItem(
              title: 'Google play',
              url:
                  'https://play.google.com/store/apps/dev?id=5842045484913788359',
              imageSvg: Assets.imagesGooglePlay,
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.title,
    required this.url,
    required this.imageSvg,
  });
  final String title;
  final String url;
  final String imageSvg;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        urlLauncher(
          Uri.parse(url),
        );
      },
      child: Card(
        color: ColorManager.charCoolColor,
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15).r),
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(10).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22.r,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(
                  imageSvg,
                ),
              ),
              Space(
                width: 35.w,
                height: 0.h,
              ),
              Text(
                title,
                style: context.textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
