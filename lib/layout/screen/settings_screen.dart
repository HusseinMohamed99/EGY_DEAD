part of '../../core/helpers/export_manager/export_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LogoWidget(),
          Text(
            appName,
            style: TextStyleManager.titleLarge(context: context),
          ),
          const Space(width: 0, height: 30),
          const ListOptionCard(),
          const Spacer(),
          Text(
            'Version: $appVersion',
            style: TextStyleManager.labelSmall(context: context),
          ),
          const Space(width: 0, height: 20),
        ],
      ),
    );
  }
}

class ListOptionCard extends StatelessWidget {
  const ListOptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        OptionCard(
          title: AppString.appPolicy,
          icon: Icons.info_outline,
          onTap: () async {
            await appPolicy();
          },
        ),
        OptionCard(
          title: AppString.contactSupport,
          icon: Icons.help_outline,
          onTap: () {
            context.pushNamed(Routes.supportScreen);
          },
        ),
        const OptionCard(
          title: AppString.rating,
          icon: Icons.star_outline,
          onTap: ratingOnPlayStore,
        ),
      ],
    );
  }
}
