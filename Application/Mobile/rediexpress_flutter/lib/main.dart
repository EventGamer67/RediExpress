import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rediexpress_flutter/presentation/screens/home_screen/home_screen.dart';
import 'package:rediexpress_flutter/presentation/screens/splash_screen/splash_screen.dart';
import 'package:rediexpress_flutter/providers/theme/theme_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {

  final Talker talker = TalkerFlutter.init();

  GetIt.I.registerSingleton<Talker>(talker);

  const url = 'https://nhqkdabncpfkducyfdzw.supabase.co';
  const anonkey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5ocWtkYWJuY3Bma2R1Y3lmZHp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDY5OTgsImV4cCI6MjAyMjc4Mjk5OH0.bPsz10JKZPuvzJquNhKCFch9-6AfzQuZhUUfivo7WZU';

  final Supabase supa = await Supabase.initialize(url: url, anonKey: anonkey);
  GetIt.I.registerSingleton<Supabase>(supa);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).theme,
          //home: const HomeScreen(startpage: 0,)
          home: const SplashScreen(),
        );
      },
    );
  }
}