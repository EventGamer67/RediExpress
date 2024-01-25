import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rediexpress_flutter/presentation/screens/splash_screen/splash_screen.dart';

void main() {
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

ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
        inverseSurface: Colors.black,
        primary: Color(0xFF0560FA),
        background: Colors.white));

ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
        inverseSurface: Colors.white,
        primary: Color(0xFF0560FA),
        background: Color(0xFF000D1D)));

class ThemeProvider extends ChangeNotifier {
  ThemeData theme = lightTheme;

  switchTheme() {
    if (theme == lightTheme) {
      theme = darkTheme;
    } else {
      theme = lightTheme;
    }
    notifyListeners();
  }
}
