import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rediexpress_flutter/presentation/screens/splash_screen/splash_screen.dart';
import 'package:rediexpress_flutter/providers/theme/theme_provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {

  final Talker talker = TalkerFlutter.init();

  GetIt.I.registerSingleton<Talker>(talker);

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
          theme: Provider.of<ThemeProvider>(context).theme,
          home: const SplashScreen(),
        );
      },
    );
  }
}


