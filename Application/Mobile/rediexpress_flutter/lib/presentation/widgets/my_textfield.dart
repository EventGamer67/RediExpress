import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatefulWidget {
  final List<TextInputFormatter> formatters;
  final String header;
  final String hint;
  final bool hidable;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  const MyTextField(
      {super.key,
      required this.formatters,
      required this.header,
      required this.keyboardtype,
      required this.hidable,
      required this.hint,
      required this.controller});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool hided = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _toggleHide() {
    setState(() {
      hided = !hided;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(this.widget.header,
            style: GoogleFonts.roboto(
                color: const Color.fromARGB(255, 167, 167, 167),
                fontWeight: FontWeight.w600,
                fontSize: 16)),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: TextField(
              obscureText: hided,
              controller: widget.controller,
              inputFormatters: widget.formatters,
              textAlignVertical: TextAlignVertical.bottom,
              style: GoogleFonts.roboto(),
              keyboardType: this.widget.keyboardtype,
              decoration: InputDecoration(
                  suffixIcon: this.widget.hidable
                      ? GestureDetector(
                          onTap: () {
                            _toggleHide();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                                hided ? 'assets/svg/vuesax/linear/eye-slash.svg' : 'assets/svg/vuesax/linear/eye.svg',
                                alignment: Alignment.center,
                                color:
                                    Theme.of(context).colorScheme.inverseSurface),
                          ))
                      : null,
                  errorStyle: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.error),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.error)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 167, 167, 167))),
                  hintText: this.widget.hint,
                  hintStyle: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 207, 207, 207)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 167, 167, 167))))),
        ),
      ],
    );
  }
}
