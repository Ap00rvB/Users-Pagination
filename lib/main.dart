import 'package:flutter/material.dart';
import 'package:pagination/route_generator.dart';

import 'pages/home_page/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const UserListWidget(),
      onGenerateRoute: routeGenerator,
    );
  }
}

