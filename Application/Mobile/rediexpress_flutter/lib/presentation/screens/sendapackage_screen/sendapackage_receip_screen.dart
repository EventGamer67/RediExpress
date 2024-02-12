// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rediexpress_flutter/presentation/screens/delivery_succesfull_screen/delivery_succesfull_screen.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/transaction_page/transaction_page.dart';
import 'package:rediexpress_flutter/presentation/screens/sendapackage_screen/sendapackage_screen.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SendAPackageReceipScreen extends StatefulWidget {
  final List<DestintionDetails> details;
  final String code;
  const SendAPackageReceipScreen(
      {super.key, required this.details, required this.code});

  @override
  State<SendAPackageReceipScreen> createState() =>
      _SendAPackageReceipScreenState();
}

class _SendAPackageReceipScreenState extends State<SendAPackageReceipScreen> {
  @override
  void initState() {
    super.initState();
  }

  _goToTransaction() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => TransactionPage(code: widget.code)));
  }

  _goToDeliverySeccussfull() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => DeliverySuccesfullScreen(code: widget.code)));
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
            const SizedBox(
              height: 24,
            ),
            Text(
              "Package information",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Origin details",
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Mbaraugba, Ovom Amaa Asaa, Abia state",
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 167, 167, 167)),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "+234 56543 96854",
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 167, 167, 167)),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Destination details",
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
            const SizedBox(
              height: 4,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(this.widget.details.length, (index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1. ${widget.details[index].adress}",
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 167, 167, 167)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${widget.details[index].phone}",
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 167, 167, 167)),
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Other details",
                    style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.inverseSurface),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Package Items",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromARGB(255, 167, 167, 167)),
                    ),
                    Text("data",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color.fromARGB(255, 236, 130, 0))),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Weight of items",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromARGB(255, 167, 167, 167)),
                    ),
                    Text("data",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color.fromARGB(255, 236, 130, 0))),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Worth of Items",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromARGB(255, 167, 167, 167)),
                    ),
                    Text("data",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color.fromARGB(255, 236, 130, 0))),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tracking Number",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromARGB(255, 167, 167, 167)),
                    ),
                    Text("data",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color.fromARGB(255, 236, 130, 0))),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 36.5,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: const Color.fromARGB(255, 167, 167, 167),
            ),
            const SizedBox(
              height: 8.5,
            ),
            Text(
              "Charges",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Charges",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color.fromARGB(255, 167, 167, 167)),
                ),
                Text("data",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 236, 130, 0))),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Instant delivery",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color.fromARGB(255, 167, 167, 167)),
                ),
                Text("data",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 236, 130, 0))),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tax and Service Charges",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color.fromARGB(255, 167, 167, 167)),
                ),
                Text("data",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 236, 130, 0))),
              ],
            ),
            const SizedBox(
              height: 8.5,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: const Color.fromARGB(255, 167, 167, 167),
            ),
            const SizedBox(
              height: 4.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Package total",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color.fromARGB(255, 167, 167, 167)),
                ),
                Text("data",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 236, 130, 0))),
              ],
            ),
            const SizedBox(
              height: 46,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 48,
                    child: Center(
                      child: Text(
                        "Edit package",
                        style: GoogleFonts.roboto(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context).colorScheme.primary)),
                  )),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () => _goToTransaction(),
                    child: Container(
                      height: 48,
                      child: Center(
                        child: Text(
                          "Make payment",
                          style: GoogleFonts.roboto(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 46,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 48,
                    child: Center(
                      child: Text(
                        "Edit package",
                        style: GoogleFonts.roboto(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context).colorScheme.primary)),
                  )),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () => _goToDeliverySeccussfull(),
                    child: Container(
                      height: 48,
                      child: Center(
                        child: Text(
                          "Make payment",
                          style: GoogleFonts.roboto(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )),
                ],
              ),
            )
          ]),
        ),
      )),
    );
  }
}
