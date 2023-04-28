import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/global/app_string/app_string.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/tvs/domain/entities/genres.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_details_bloc.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_details_events.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_details_states.dart';

class TvsDetailsScreen extends StatelessWidget {
  final int tvsID;

  const TvsDetailsScreen({Key? key, required this.tvsID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<TvsDetailsBloc>()..add(GetTvsDetailsEvent(tvsID));
      },
      child: const Scaffold(
        body: TvsDetailsContent(),
      ),
    );
  }
}

class TvsDetailsContent extends StatelessWidget {
  const TvsDetailsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsDetailsBloc, TvsDetailsStates>(
      builder: (context, state) {
        switch (state.tvsDetailsStates) {
          case RequestState.loading:
            return const SizedBox(
                height: 400, child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return DefaultTabController(
              length: 2,
              initialIndex: 1,
              child: Scaffold(
                body: SingleChildScrollView(
                  key: const Key('tvDetailScrollView'),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3,
                            imageUrl: ApiConstance.imageURL(
                                state.tvsDetails!.backdropPath),
                            fit: BoxFit.fill,
                          ),
                          FadeInUp(
                            from: 20,
                            duration: const Duration(milliseconds: 500),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CachedNetworkImage(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      imageUrl: ApiConstance.imageURL(
                                          state.tvsDetails!.posterPath),
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 16.0),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(state.tvsDetails!.name,
                                              style: GoogleFonts.poppins(
                                                fontSize: 23,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.2,
                                              )),
                                          const SizedBox(height: 8.0),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 2.0,
                                                  horizontal: 8.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[800],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Text(
                                                  state.tvsDetails!.firstDate
                                                      .split('-')[0],
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 16.0),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 20.0,
                                                  ),
                                                  const SizedBox(width: 4.0),
                                                  Text(
                                                    (state.tvsDetails!
                                                                .voteAverage /
                                                            2)
                                                        .toStringAsFixed(1),
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4.0),
                                                  Text(
                                                    '(${state.tvsDetails!.voteAverage})',
                                                    style: const TextStyle(
                                                      fontSize: 1.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 16.0),
                                              Text(
                                                _showDuration(
                                                    state.tvsDetails!.runtime),
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1.2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.tvsDetails!.overview,
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        'Genres: ${_showGenres(state.tvsDetails!.genres)}',
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TabBar(
                            labelColor: Colors.red,
                            unselectedLabelColor: Colors.green,
                            indicatorColor: Colors.yellow,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(
                                child: FadeInUp(
                                  from: 20,
                                  duration: const Duration(milliseconds: 500),
                                  child: const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      AppString.recommendations,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: FadeInUp(
                                  from: 20,
                                  duration: const Duration(milliseconds: 500),
                                  child: const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      AppString.moreLikeThis,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 500,
                            child: const TabBarView(
                              children: [],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                          top: 40,
                          child: IconButton(
                              onPressed: () {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              },
                              icon: const Icon(Icons.arrow_back_ios))),
                    ],
                  ),
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
                height: 400,
                child: Center(child: Text(state.tvsDetailsMessage)));
        }
      },
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(List<int> runtime) {
    final int hours = runtime[0] ~/ 60;
    final int minutes = runtime[0] % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
