import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/helpers/enum/enum.dart';
import 'package:movies_app/core/helpers/theme/style/color_manger.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/domain/entities/cast.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';

part '../logs/app_logs.dart';
part './../../components/cached_image.dart';
part './../../components/cast_card.dart';
part './../../components/list_view_card.dart';
part './../../components/size_box.dart';
part './../../components/upgrade_wrapper.dart';
part './../../error/exceptions.dart';
part './../../extensions/snack_bar.dart';
part '../theme/style/responsive_font_size.dart';
part '../theme/style/text_style.dart';
part './../../network/cache_helper.dart';
part './../function/function.dart';

part './../theme/theme_data/theme_data.dart';
