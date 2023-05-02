import 'dart:async';

import 'package:flutter/material.dart';
import 'package:henri_ppp/providers/create_post_provider.dart';
import 'package:henri_ppp/providers/feed_provider.dart';
import 'package:henri_ppp/providers/status_provider.dart';
import 'package:henri_ppp/providers/user_provider.dart';
import 'package:henri_ppp/views/onboarding/view/login.dart';
import 'package:henri_ppp/helpers/theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Henri PPP',
        theme: themedata,
        home: const Splash(),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/blankScreen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo3.png',
                height: MediaQuery.of(context).size.height * 0.35,
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<StatusProvider>(create: (_) => StatusProvider()),
  ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
  ChangeNotifierProvider<FeedProvider>(create: (_) => FeedProvider()),
  ChangeNotifierProvider<createPostProvider>(
      create: (_) => createPostProvider()),
];
