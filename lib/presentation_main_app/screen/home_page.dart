part of './../../core/helpers/export_manager/export_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.lost) {
                context.showSnackBar(
                  AppString.checkInternetConnection,
                  color: ColorManager.primaryRedColor,
                );
              }
            },
            builder: (context, state) {
              if (state == InternetState.gained) {
                // Navigate to MainScreen once connected
                Future.microtask(() {
                  context.pushNamed(Routes.mainScreen);
                });
                return const CircularProgressIndicator
                    .adaptive(); // Temporary loading indicator while navigating
              } else if (state == InternetState.lost) {
                return SvgPicture.asset(Assets.imagesError);
              } else {
                return const CircularProgressIndicator
                    .adaptive(); // Loading indicator
              }
            },
          ),
        ),
      ),
    );
  }
}
