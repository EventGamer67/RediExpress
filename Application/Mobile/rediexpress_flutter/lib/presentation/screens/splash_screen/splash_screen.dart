import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rediexpress_flutter/presentation/screens/onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    goNext(context);
  }

  void goNext(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SvgPicture.asset('assets/svg/Frame.svg'),
      ),
    );
  }
}
