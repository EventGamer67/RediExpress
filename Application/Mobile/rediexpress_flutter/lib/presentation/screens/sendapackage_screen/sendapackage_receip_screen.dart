// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rediexpress_flutter/presentation/screens/sendapackage_screen/sendapackage_screen.dart';

class SendAPackageReceipScreen extends StatefulWidget {
  final List<DestintionDetails> details;
  const SendAPackageReceipScreen({super.key, required this.details});

  @override
  State<SendAPackageReceipScreen> createState() =>
      _SendAPackageReceipScreenState();
}

class _SendAPackageReceipScreenState extends State<SendAPackageReceipScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
          "Send a package",
          style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 167, 167, 167)),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 24,
            ),
            Text(
              "Package information",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Origin details",
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Mbaraugba, Ovom Amaa Asaa, Abia state",
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 167, 167, 167)),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "+234 56543 96854",
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 167, 167, 167)),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Destination details",
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
            SizedBox(
              height: 4,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(this.widget.details.length, (index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "1. ${widget.details[index].adress}",
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 167, 167, 167)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${widget.details[index].phone}",
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 167, 167, 167)),
                    ),
                  ],
                );
              }).toList(),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Other details",
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
          ]),
        ),
      )),
    );
  }
}
