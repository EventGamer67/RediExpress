import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:rediexpress_flutter/presentation/screens/home_screen/home_screen.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_filled.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_outlined.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DeliverySuccesfullScreen extends StatefulWidget {
  final String code;
  const DeliverySuccesfullScreen({super.key, required this.code});

  @override
  State<DeliverySuccesfullScreen> createState() =>
      _DeliverySuccesfullScreenState();
}

class _DeliverySuccesfullScreenState extends State<DeliverySuccesfullScreen>
    with SingleTickerProviderStateMixin {
  int starts = 0;

  double angle = 0;
  bool active = true;
  late final Timer timer;

  late final StreamSubscription gyroStream;
  bool alreadyStared = false;

  @override
  void initState() {
    super.initState();
    _fakeRotate();

    gyroStream =
        gyroscopeEventStream(samplingPeriod: const Duration(milliseconds: 150))
            .listen((event) {
      _trackGyro(event);
    });
  }

  _trackGyro(GyroscopeEvent event) {
    final double y = event.y.floor().toDouble();
    if (y != 0.0) {
      GetIt.I.get<Talker>().good(y);
      if (y > 2 && !alreadyStared) {
        alreadyStared = true;
        setState(() {
          starts = math.min(5, starts + 1);
        });
      }
      if (y < -2 && !alreadyStared) {
        alreadyStared = true;
        setState(() {
          starts = math.max(0, starts - 1);
        });
      }
      if (y <= 1 && y >= -1) {
        alreadyStared = false;
      }
    }
  }

  @override
  void dispose() {
    gyroStream.cancel();
    super.dispose();
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
                height: 210,
              ),
              Text(
                "Rate driver",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 16,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      5,
                      (index) => Container(
                            padding:
                                EdgeInsets.only(right: index != 4 ? 16 : 0),
                            child: SvgPicture.asset(
                              "assets/svg/icons/star.svg",
                              color: index < starts
                                  ? Color.fromARGB(255, 236, 130, 0)
                                  : Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                            ),
                          )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/icons/Vector (4).svg",
                        width: 13.3,
                        height: 13.3,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        width: 13.3,
                      ),
                      Text(
                        "Add feedback",
                        style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 167, 167, 167)),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 1,
                      offset: Offset(
                        0,
                        1.5,
                      ),
                      spreadRadius: 1),
                ]),
              ),
              const SizedBox(
                height: 76,
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
                  text: "Done"),
            ],
          ),
        ),
      ),
    );
  }
}
