import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:new_story/_routing/routes.dart';
import 'package:new_story/views/landing.dart';
import 'package:new_story/views/register.dart';
import 'package:new_story/views/reset_password.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingViewRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case registerViewRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case resetPasswordViewRoute:
      return MaterialPageRoute(builder: (context) => ResetPasswordPage());
    //break;
//    case mapViewRoute:
//      return MaterialPageRoute(builder: (context) => MapViewMain());
//    case FeedViewRoute:
//      return MaterialPageRoute(builder: (context) => StorageUploadFeed());
//    case chatDetailsViewRoute:
//      return MaterialPageRoute(builder: (context) => ChatDetailsPage(userId: settings.arguments));
//    case userDetailsViewRoute:
//      return MaterialPageRoute(builder: (context) => UserDetailsPage(userId: settings.arguments));

    default:
      return MaterialPageRoute(builder: (context) => LandingPage());
  }
}
