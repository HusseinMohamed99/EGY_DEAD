import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/global/app_string/app_string.dart';
import 'package:movies_app/core/global/theme/style/color_manger.dart';
import 'package:movies_app/core/global/theme/theme_data/theme_data.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_states.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData[AppTheme.darkTheme]!.textTheme;

    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        if (state.nowPlayingState == RequestState.loaded) {
          return Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.red,
              highlightColor: Colors.red,
              duration: Duration(seconds: 1),
            ),
            enabled: false,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 300.h,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items: state.nowPlayingMovies.map(
                (item) {
                  return GestureDetector(
                    key: const Key('openMovieMinimalDetail'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return MovieDetailsScreen(movieID: item.id);
                          },
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedImage(
                            boxFit: BoxFit.fill,
                            imageUrl: ApiConstance.imageURL(item.backdropPath),
                            width: double.infinity,
                            height: 560.h,
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 40),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80).r,
                                  child: CachedImage(
                                    boxFit: BoxFit.fill,
                                    imageUrl: ApiConstance.imageURL(
                                      item.posterPath,
                                    ),
                                    width: 120.w,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0).r,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: ColorManager.primaryRedColor,
                                          size: 16.sp,
                                        ),
                                        Space(height: 0, width: 4),
                                        Text(
                                          AppString.nowPlaying.toUpperCase(),
                                          style: textTheme.bodyLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16).r,
                                    child: Text(
                                      item.title,
                                      textAlign: TextAlign.center,
                                      style: textTheme.titleLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 300,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items: [
                CachedImage(
                  boxFit: BoxFit.fill,
                  imageUrl: '',
                  width: double.infinity,
                  height: 560,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
