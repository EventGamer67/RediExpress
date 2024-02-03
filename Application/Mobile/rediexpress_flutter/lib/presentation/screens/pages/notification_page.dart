import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
          "Notification",
          style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 167, 167, 167)),
        ),
      ),
      body: SafeArea(
          child: Container(
        color: Theme.of(context).colorScheme.background,
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: 390,
          width: 390,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/notification.svg",
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 204, 204, 204),
                  width: 83,
                  height: 83,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "You have no notifications",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.inverseSurface),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
