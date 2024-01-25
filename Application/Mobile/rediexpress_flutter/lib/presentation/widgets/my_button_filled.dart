import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtonFilled extends StatelessWidget {
  final Function onClick;
  final String text;
  final double width;
  final double height;
  final double fontSize;
  const MyButtonFilled(
      {super.key,
      required this.onClick,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick.call();
      },
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: const Color.fromARGB(255, 5, 95, 250)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(text,
                  style: GoogleFonts.roboto(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
        ),
      ),
    );
  }
}