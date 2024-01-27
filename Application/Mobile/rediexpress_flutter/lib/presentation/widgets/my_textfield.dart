import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyTextField extends StatefulWidget {
  final List<TextInputFormatter> formatters;
  final String header;
  final String hint;
  final bool hidable;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final String? Function(String?)? validator;
  const MyTextField(
      {super.key,
      required this.formatters,
      required this.header,
      required this.keyboardtype,
      required this.hidable,
      required this.hint,
      required this.validator,
      required this.controller});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool hided = false;
  bool correct = true;

  @override
  void initState() {
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
        Text(widget.header,
            style: GoogleFonts.roboto(
                color: const Color.fromARGB(255, 167, 167, 167),
                fontWeight: FontWeight.w600,
                fontSize: 16)),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: Expanded(
            child: TextFormField(
                obscureText: hided,
                controller: widget.controller,
                inputFormatters: widget.formatters,
                textAlignVertical: TextAlignVertical.bottom,
                style: GoogleFonts.roboto(color: correct ? Theme.of(context).colorScheme.inverseSurface :Theme.of(context).colorScheme.error ),
                keyboardType: widget.keyboardtype,
                validator: widget.validator,
                decoration: InputDecoration(
                    suffixIcon: widget.hidable
                        ? GestureDetector(
                            onTap: () {
                              _toggleHide();
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                  hided
                                      ? 'assets/svg/vuesax/linear/eye-slash.svg'
                                      : 'assets/svg/vuesax/linear/eye.svg',
                                  alignment: Alignment.center,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface),
                            ))
                        : null,
                    errorStyle: const TextStyle(fontSize: 0),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).colorScheme.error)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 167, 167, 167))),
                    hintText: widget.hint,
                    hintStyle: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 207, 207, 207)),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 167, 167, 167))))),
          ),
        ),
      ],
    );
  }
}

var phoneMask = MaskTextInputFormatter(
    mask: '+#(###)###-##-##', type: MaskAutoCompletionType.eager);
