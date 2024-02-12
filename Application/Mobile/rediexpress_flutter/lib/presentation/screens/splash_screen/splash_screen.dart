import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:rediexpress_flutter/presentation/screens/home_screen/home_screen.dart';
import 'package:rediexpress_flutter/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
    if (GetIt.I.get<Supabase>().client.auth.currentSession == null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen(startpage: 0)));
    }
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
