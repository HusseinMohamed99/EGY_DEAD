part of './../../core/helpers/export_manager/export_manager.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.darkPrimary,
        elevation: 0,
        title: Text(
          AppString.appPolicy,
          style: context.textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w, top: 20.h, bottom: 20.h),
              child: CircleAvatar(
                maxRadius: 43.r,
                minRadius: 43.r,
                backgroundColor: ColorManager.primaryGreenColor,
                child: CircleAvatar(
                  maxRadius: 40.r,
                  minRadius: 40.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(95).r,
                    child: Image.asset(
                      Assets.imagesLogo,
                      fit: BoxFit.fitHeight,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(4).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15).r,
                  border: Border.all(
                    color: ColorManager.primaryGreenColor,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16).r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15).r,
                    border: Border.all(
                      color: ColorManager.primaryGreenColor,
                    ),
                  ),
                  child: ListView(
                    children: [
                      Text(
                        AppString.aboutUsBody,
                        style: context.textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
