import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfoBlock extends StatefulWidget {
  const ProfileInfoBlock({
    super.key,
  });

  @override
  State<ProfileInfoBlock> createState() => _ProfileInfoBlockState();
}

class _ProfileInfoBlockState extends State<ProfileInfoBlock> {
  bool hided = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(7.5),
            child: CircleAvatar(
              radius: 30,
              foregroundImage:
                  NetworkImage("https://via.placeholder.com/60x60"),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Hello Ken",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                RichText(
                  text: TextSpan(
                      text: "Current balance: ",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                      children: [
                        TextSpan(
                            text: hided
                                ? "N10,712:00"
                                : (List.generate(
                                        "N10,712:00".length, (index) => "*")
                                    .join()),
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.primary,
                            ))
                      ]),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                hided = !hided;
              });
            },
            child: SvgPicture.asset(
              "assets/svg/vuesax/linear/eye-slash.svg",
              width: 16,
              height: 16,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          )
        ],
      ),
    );
  }
}
