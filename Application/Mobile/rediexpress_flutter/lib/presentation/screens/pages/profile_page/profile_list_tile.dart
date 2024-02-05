import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rediexpress_flutter/Data/profile/profile_list_data.dart';

class ProfileListTile extends StatelessWidget {
  final ProfileListTileData data;
  const ProfileListTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          data.onTap.call(context);
        },
        child: Container(
          height: 62,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: const Offset(0, 1))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  data.image,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.title,
                      style: GoogleFonts.roboto(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      data.subString,
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 167, 167, 167),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
                SvgPicture.asset(
                  "assets/svg/Vector.svg",
                  color: Theme.of(context).colorScheme.inverseSurface,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}