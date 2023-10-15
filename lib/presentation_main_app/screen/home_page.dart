import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/presentation_main_app/controller/internet_bloc.dart';
import 'package:movies_app/presentation_main_app/screen/main_screen.dart';

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
              if (state == InternetState.gained) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Connected'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state == InternetState.lost) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Not Connected'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state == InternetState.gained) {
                // Show your information when connected
                return const MainScreen();
              } else if (state == InternetState.lost) {
                return SvgPicture.asset('assets/images/error.svg');
              } else {
                return const CircularProgressIndicator(); // Loading indicator
              }
            },
          ),
        ),
      ),
    );
  }
}
