import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rediexpress_flutter/presentation/screens/home_screen/home_screen.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_filled.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_outlined.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TransactionPage extends StatefulWidget {
  final String code;
  const TransactionPage({super.key, required this.code});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage>
    with SingleTickerProviderStateMixin {
  double angle = 0;
  bool active = true;
  late final Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fakeRotate();
  }

  _fakeRotate() async {
    timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        angle += 0.01;
      });
    });
    await Future.delayed(Duration(seconds: 1));
    timer.cancel();
    active = false;
    angle = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.rotate(
                angle: angle,
                child: Image.asset(
                  active
                      ? "assets/svg/icons/Ellipse 32-2.png"
                      : "assets/svg/icons/Good Tick.png",
                  height: active ? 120 : 130,
                  width: active ? 120 : 130,
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              Text(
                "Your rider is on the way to your destination",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.inverseSurface),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tracking Number ",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.inverseSurface),
                  ),
                  Text(
                    "${widget.code}",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              SizedBox(
                height: 140,
              ),
              MyButtonFilled(
                  enabled: true,
                  onClick: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return HomeScreen(
                        startpage: 2,
                      );
                    }));
                  },
                  width: double.infinity,
                  height: 46,
                  fontSize: 16,
                  text: "Track my item"),
              SizedBox(
                height: 8,
              ),
              MyButtonOutlined(
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  width: double.infinity,
                  height: 46,
                  weight: FontWeight.w700,
                  text: "Go back to homepage")
            ],
          ),
        ),
      ),
    );
  }
}
