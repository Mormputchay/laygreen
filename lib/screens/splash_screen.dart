import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:laygreen/screens/main_tabview/bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FlutterSplashScreen(
        duration: const Duration(seconds: 6),
        nextScreen: const MainTabView(),
        backgroundColor: Colors.green.shade900,
        splashScreenBody: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/logo.png',
                width: 300,
                height: 300,
              ),
              CircularProgressIndicator(
                color: Colors.white10.withOpacity(0.5),
                strokeWidth: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
