import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rediexpress_flutter/presentation/screens/otp_screen/otp_screen.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_filled.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_textfield.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController _emailController;
  bool termCB = false;
  bool correct = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  _checkCorrect() {
    setState(() {
      correct = EmailValidator.validate(_emailController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            _checkCorrect();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot password",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                    Text("Enter your email address",
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
              MyTextField(
                hidable: false,
                validator: null,
                // validator: (value) {
                //   if (value != null && value != "") {
                //     if (EmailValidator.validate(value!)) {
                //     } else {
                //       return 'err';
                //     }
                //   }
                //   return 'err';
                // },
                header: "Email adress",
                formatters: const [
                  //idk how to make it
                ],
                keyboardtype: TextInputType.emailAddress,
                hint: "*********@gmail.com",
                controller: _emailController,
              ),
              const SizedBox(
                height: 56,
              ),
              MyButtonFilled(
                  enabled: correct,
                  onClick: () async {
                    try {
                      if (EmailValidator.validate(_emailController.text)) {
                        final client = GetIt.I.get<Supabase>().client;
                        await client.auth
                            .signInWithOtp(email: _emailController.text);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OTPScreen(
                                  email: _emailController.text,
                                )));
                      }
                    } catch (err) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(err.toString())));
                    }
                  },
                  width: double.infinity,
                  height: 45,
                  fontSize: 16,
                  text: "Send OTP"),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                    text: "Remember password ",
                    style: const TextStyle(
                        color: Color(0xFFA6A6A6), fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          text: "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
