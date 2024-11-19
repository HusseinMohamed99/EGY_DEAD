part of './../../core/helpers/export_manager/export_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 60.h,
              bottom: 20.h,
            ),
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
                    fit: BoxFit.fitHeight,
                    width: double.infinity,
                    height: 200.h,
                  ),
                ),
              ),
            ),
          ),
          Text(
            appName,
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                color: ColorManager.whiteColor,
                fontSize: getResponsiveFontSize(context, fontSize: 25),
              ),
            ),
          ),
          Space(width: 0, height: 30),
          SettingCardItem(
            title: AppString.aboutUs,
            icon: Icons.info_outline,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) {
              //       return const AboutUsScreen();
              //     },
              //   ),
              // );
            },
          ),
          Space(width: 0, height: 8),
          SettingCardItem(
            title: AppString.contactSupport,
            icon: Icons.help_outline,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SupportScreen();
                  },
                ),
              );
            },
          ),
          Space(width: 0, height: 8),
          SettingCardItem(
            title: AppString.rating,
            icon: Icons.star_outline,
            onTap: () {
              goToApplicationOnPlayStore();
            },
          ),
          Spacer(),
          Text(
            'Version: $appVersion',
            style: context.textTheme.bodySmall,
          ),
          Space(width: 0, height: 20),
        ],
      ),
    );
  }
}

void goToApplicationOnPlayStore() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String url = '';
  String packageName = packageInfo.packageName;
  if (Platform.isAndroid) {
    url = 'https://play.google.com/store/apps/details?id=$packageName';
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}

class SettingCardItem extends StatelessWidget {
  const SettingCardItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final VoidCallback onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
      color: ColorManager.charCoolColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15).r,
      ),
      elevation: 10,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22.r,
                backgroundColor: const Color.fromRGBO(105, 155, 247, 0.15),
                child: Icon(
                  icon,
                  size: 26.sp,
                  color: ColorManager.primaryGreenColor,
                ),
              ),
              Space(width: 35, height: 0),
              Text(
                title,
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
