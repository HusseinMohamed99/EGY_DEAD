part of './../../core/helpers/export_manager/export_manager.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.charCoolColor,
        elevation: 0,
        title: Text(
          AppString.contactSupport,
          style: TextStyleManager.titleMedium(context: context),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LogoWidget(
            topPadding: 16.h,
          ),
          Column(
            spacing: 8.h,
            children: [
              OptionCard(
                title: 'Mail',
                imageWidget: SvgPicture.asset(
                  Assets.imagesGoogle,
                  width: 30.w,
                  height: 30.h,
                ),
                onTap: () {
                  urlLauncher(Uri.parse('mailto:hussein.mohmed1907@gmail.com'));
                },
              ),
              OptionCard(
                title: 'GitHub',
                imageWidget: SvgPicture.asset(
                  Assets.imagesGithub,
                  width: 30.w,
                  height: 30.h,
                ),
                onTap: () {
                  urlLauncher(Uri.parse('https://github.com/HusseinMohamed99'));
                },
              ),
              OptionCard(
                title: 'LinkedIn',
                imageWidget: SvgPicture.asset(
                  Assets.imagesLinkedin,
                  width: 30.w,
                  height: 30.h,
                ),
                onTap: () {
                  urlLauncher(
                      Uri.parse('https://www.linkedin.com/in/hussein99'));
                },
              ),
              OptionCard(
                title: 'Google play',
                imageWidget: SvgPicture.asset(
                  Assets.imagesGooglePlay,
                  width: 30.w,
                  height: 30.h,
                ),
                onTap: () {
                  urlLauncher(Uri.parse(
                    'https://play.google.com/store/apps/dev?id=5842045484913788359',
                  ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
