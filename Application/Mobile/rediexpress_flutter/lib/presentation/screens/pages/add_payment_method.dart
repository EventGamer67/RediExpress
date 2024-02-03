import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SizedBox(
            width: 24,
            height: 24,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset(
                  "assets/svg/arrow-square-right.svg",
                )),
          ),
        ),
        title: Text(
          "Add Payment method",
          style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 167, 167, 167)),
        ),
      ),
      body: SafeArea(
          child: Container(
        color: Theme.of(context).colorScheme.background,
      )),
    );
  }
}
