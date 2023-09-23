import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagination/pages/home_page/user_list_model.dart';
import 'package:pagination/pages/user_detail/user_detail_screen.dart';

Route<dynamic> routeGenerator(RouteSettings settings) {
  dynamic route;
  switch (settings.name) {
    case UserDetailScreen.routeName:
      final Map<String, dynamic> args =
          settings.arguments as Map<String, dynamic>;
      Person user = args[UserDetailScreen.paramUserModel];
      route = UserDetailScreen(
        person: user,
      );
      break;
    default:
      throw Exception('Invalid route ${settings.name}');
  }
  return MaterialPageRoute(
    builder: (context) =>
        Directionality(textDirection: TextDirection.ltr, child: route),
    settings: settings,
  );
}
