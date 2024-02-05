import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Wallet_TopUp_block extends StatelessWidget {
  const Wallet_TopUp_block({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 207, 207, 207)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              "Top up",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                          child: SvgPicture.asset("assets/bankICon.svg")),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Bank",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                          child: SvgPicture.asset("assets/transferICon.svg")),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Transfer",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                          child: SvgPicture.asset("assets/cardIcon.svg")),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Card",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
