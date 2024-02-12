import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_filled.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../newpassword_screen/newpassword_screen.dart';

class OTPScreen extends StatefulWidget {
  final String email;
  const OTPScreen({super.key, required this.email});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late final TextEditingController mail;
  late Timer timer;
  late final TextEditingController controller;
  bool errored = false;
  String remainTime = '';

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  _timerTick(Timer timer) {
    GetIt.I.get<Talker>().critical(timer);
    GetIt.I.get<Talker>().good("Timer tick");
    if (timer.tick >= 60) {
      timer.cancel();
      GetIt.I.get<Talker>().debug("timer stop");
    }
    setState(() {
      remainTime = (60 - timer.tick).toString();
    });
  }

  _sendOTP() async {
    try {
      if (!timer.isActive) {
        final client = GetIt.I.get<Supabase>().client;
        await client.auth
            .signInWithOtp(email: widget.email, shouldCreateUser: false);
        timer = Timer.periodic(
            const Duration(seconds: 1), (timer) => _timerTick(timer));
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  _verifyOTP(String text) async {
    try {
      GetIt.I.get<Talker>().good(text);
      final AuthResponse response = await GetIt.I
          .get<Supabase>()
          .client
          .auth
          .verifyOTP(email: widget.email, token: text, type: OtpType.email);
      if (response.session != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NewPasswordScreen(email: widget.email,)));
      } else {
        setState(() {
          controller.clear();
          errored = true;
        });
      }
    } catch (error) {
      GetIt.I.get<Talker>().critical(error);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  @override
  void initState() {
    mail = TextEditingController();
    super.initState();
    controller = TextEditingController();
    timer = Timer(Duration.zero, () {});
    _sendOTP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "OTP Verification",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                    Text("Enter the 6 digit numbers sent to your email",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 167, 167, 167),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 56,
              ),
              Pinput(
                length: 6,
                onCompleted: (value) {
                  _verifyOTP(value);
                },
                keyboardType: TextInputType.number,
                controller: controller,
                defaultPinTheme: PinTheme(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: errored
                                ? Color.fromARGB(255, 237, 58, 58)
                                : Color.fromARGB(255, 167, 167, 167))),
                    width: 32,
                    height: 32),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              const SizedBox(
                height: 30,
              ),
              Text("If you didn’t receive code, resend after $remainTime",
                  style: TextStyle(
                      color: timer.isActive
                          ? const Color.fromARGB(255, 167, 167, 167)
                          : Colors.transparent)),
              const SizedBox(
                height: 80,
              ),
              MyButtonFilled(
                  enabled: true,
                  onClick: () async {
                    _sendOTP();
                  },
                  width: double.infinity,
                  height: 45,
                  fontSize: 16,
                  text: "Set new password"),
            ],
          ),
        ),
      ),
    );
  }
}
