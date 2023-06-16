import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_provider/utils/provider/user_provider.dart';
import 'package:user_provider/value/app_globals/app_strings.dart';

import 'modules/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserProvider(),
      child: MaterialApp(
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}



