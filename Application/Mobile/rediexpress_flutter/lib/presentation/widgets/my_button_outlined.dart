import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtonOutlined extends StatelessWidget {
  final Function onClick;
  final String text;
  final double width;
  final double height;
  const MyButtonOutlined(
      {super.key,
      required this.onClick,
      required this.width,
      required this.height,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick.call();
      },
      child: Container(
        width: this.width,
        height: this.height,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
              width: 1,
              color: Color.fromARGB(255, 5, 95, 250),
              strokeAlign: BorderSide.strokeAlignInside),
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(text,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 5, 95, 250)))),
        ),
      ),
    );
  }
}