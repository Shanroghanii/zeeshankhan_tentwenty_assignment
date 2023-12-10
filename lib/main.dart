import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/utils/theme.dart';
import 'package:task/view/navbar/navbar.dart';
import 'package:task/view/navbar/navbar_notifier.dart';
import 'package:task/view/watch/search_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (_) => NavigationProvider(),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (_) => SearchProvider(),
        ),
        // Add more providers as needed
      ],
      child: MaterialApp(
        title: '',
        theme: AppThemes.lightTheme,
        home: const Navbar(),
      ),
    );
  }
}

