part of './core/helpers/export_manager/export_manager.dart';

class EgyDeadApp extends StatelessWidget {
  const EgyDeadApp({super.key, required this.appRouter});
  final AppRouters appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        SystemChrome.setPreferredOrientations(
          [
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ],
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.homePage,
          onGenerateRoute: appRouter.generateRoute,
          title: AppString.appTitle,
          theme: getThemeData(context)[AppTheme.darkTheme],
          darkTheme: getThemeData(context)[AppTheme.darkTheme],
        );
      },
    );
  }
}
