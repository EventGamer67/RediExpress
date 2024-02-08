import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rediexpress_flutter/presentation/screens/home_screen/home_screen.dart';
import 'package:rediexpress_flutter/providers/theme/theme_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {

  final Talker talker = TalkerFlutter.init();

  GetIt.I.registerSingleton<Talker>(talker);

  const url = 'https://ojbsikxdqcbuvamygezd.supabase.co';
  const anonkey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9qYnNpa3hkcWNidXZhbXlnZXpkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE4MDY4OTgsImV4cCI6MjAxNzM4Mjg5OH0.jV7YiBEePGjybsL8qqXWeQ9PX8_3yctpq14Gfwh39JM';

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
          home: const HomeScreen(startpage: 0,)
          //home: const SplashScreen(),
        );
      },
    );
  }
}