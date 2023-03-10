import 'package:flutter/material.dart';
import 'package:mytestapp/provider/theme_provider.dart';
import 'package:mytestapp/routes.dart';
import 'package:mytestapp/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(context))
      ],
      child: const PMSNApp(),
    );
  }
}

class PMSNApp extends StatelessWidget {
  const PMSNApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: theme.getthemeData(),
      routes: getApplicationRoutes(),
      home: const LoginScreen(),
    );
  }
}
