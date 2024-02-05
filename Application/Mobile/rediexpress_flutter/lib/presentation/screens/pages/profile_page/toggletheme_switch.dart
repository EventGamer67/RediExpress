import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleSwitchTheme extends StatelessWidget {
  final Function(bool theme) switchTheme;
  final bool isDarkTheme;
  const ToggleSwitchTheme(
      {super.key, required this.switchTheme, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Enable dark mode",
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.inverseSurface,
                fontSize: 16),
          ),
          SizedBox(
            width: 60,
            height: 30,
            child: FittedBox(
              alignment: Alignment.centerRight,
              fit: BoxFit.scaleDown,
              child: CupertinoSwitch(
                applyTheme: true,
                value: isDarkTheme,
                onChanged: (value) {
                  switchTheme(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}