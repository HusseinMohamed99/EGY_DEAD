part of '../../core/helpers/export_manager/export_manager.dart';

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
          LogoWidget(topPadding: 16.h),
          Column(
            spacing: 8.h,
            children: [
              OptionCard(
                title: 'Mail',
                imageWidget: Assets.imagesGoogle,
                onTap: () {
                  if (dotenv.env['email'] != null) {
                    urlLauncher(Uri.parse(dotenv.env['email']!));
                  }
                },
              ),
              OptionCard(
                title: 'GitHub',
                imageWidget: Assets.imagesGithub,
                onTap: () {
                  if (dotenv.env['github'] != null) {
                    urlLauncher(Uri.parse(dotenv.env['github']!));
                  }
                },
              ),
              OptionCard(
                title: 'LinkedIn',
                imageWidget: Assets.imagesLinkedin,
                onTap: () {
                  if (dotenv.env['linkedin'] != null) {
                    urlLauncher(Uri.parse(dotenv.env['linkedin']!));
                  }
                },
              ),
              OptionCard(
                title: 'Google play',
                imageWidget: Assets.imagesGooglePlay,
                onTap: () {
                  if (dotenv.env['googlePlay'] != null) {
                    urlLauncher(Uri.parse(dotenv.env['googlePlay']!));
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
